import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:reminder/main.dart';
import 'package:reminder/ui/main_page/widgets/drop_down_list_controller.dart';
import 'package:reminder/ui/main_page/widgets/switch_button.dart';
import 'package:reminder/uitls/constants/constants.dart';
import 'package:reminder/uitls/storage_controller.dart';



class MainPageController extends GetxController{

  Rx<TimeOfDay> from;
  Rx<TimeOfDay> to;
  RxString selectedTime = ''.obs;
  RxString selectedVoice = ''.obs;

  SwitchButtonController voiceController = SwitchButtonController(
    name: "تنبيه الصوت".tr,
    value: StorageController().voiceSwitchButton.obs,
  );

  SwitchButtonController notificationController = SwitchButtonController(
    name: "تنبيه الاشعارات".tr,
    value: StorageController().notificationSwitchButton.obs,
    );

  SwitchButtonController sleepController = SwitchButtonController(
      name: "عدم الازعاج اثناء النوم".tr,
      value: StorageController().sleepSwitchButton.obs
  );

  AppDropdownButtonController times = AppDropdownButtonController(
      items: Constants.ALARM_TIME.keys.toList().obs,
      selectedItem: StorageController().timeAlarm);

  AppDropdownButtonController voices = AppDropdownButtonController(items: Constants.VOICE_TYPE.toList().obs,
    selectedItem: StorageController().voiceAlarm,
  );


  selectFromTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: from.value,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(timeOfDay != null && timeOfDay != from.value)
    {
        from.value = timeOfDay;
    }
  }

  selectToTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: to.value,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != to.value)
    {
      to.value = timeOfDay;
    }
  }

  toggleNotification(val){
    StorageController().notificationSwitchButton = val;
  }

  toggleVoice(val){
    StorageController().voiceSwitchButton = val;
  }

  toggleSleepTime(val){
    StorageController().sleepSwitchButton = val;
  }

  timeOnChange(val){
      scheduleAlarm(DateTime.now().add(Duration(seconds: Constants.ALARM_TIME[val])));
      selectedTime.value = val;
     setTimer(val);
     StorageController().timeAlarm = val;

  }

  setTimer(val){

    Timer(
        Duration(seconds: Constants.ALARM_TIME[val]),
            () {

          if(!(checkIfItIsSleepTime(TimeOfDay.now()) && StorageController().sleepSwitchButton)
                                                                              && StorageController().notificationSwitchButton)
              scheduleAlarm(DateTime.now());
          if(selectedTime.value  == val)
             setTimer(val);
        });
  }

  voiceOnChange(val){
    selectedVoice.value = val.obs;
    StorageController().voiceAlarm = val;
  }

  void scheduleAlarm(DateTime scheduledNotificationDateTime) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'Channel for Alarm notification',
      playSound:  StorageController().voiceSwitchButton,
      icon: '@mipmap/launcher_icon',
      sound: RawResourceAndroidNotificationSound(voices?.selectedItem.toString() == "type1"? "a": "b"),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),
    );

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(0, 'تذكير', "تذكير ",
        scheduledNotificationDateTime, platformChannelSpecifics);
  }

  bool checkIfItIsSleepTime(TimeOfDay current){
    if(from.value.hour > to.value.hour || (from.value.hour == to.value.hour && from.value.minute > to.value.minute)) /// 22 - 10
    {
      if(current.hour <= 12)
      {
        if((current.hour > from.value.hour || (from.value.hour == current.hour && from.value.minute < current.minute)) )
           return true;
         return false;
      }
      else if (current.hour < to.value.hour || (to.value.hour == current.hour && to.value.minute > current.minute))
        return true;
      return false;
    }
    else /// 1 - 12
    {
      if(from.value.hour == to.value.hour && current.hour ==  to.value.hour) /// 12.1 - 12.54
      {
        if(current.minute > from.value.minute && current.minute < to.value.minute)
          return true;
      }
      else if((current.hour > from.value.hour && current.hour < to.value.hour)
          || (current.hour == from.value.hour && current.minute > from.value.minute)
          || (current.hour == to.value.hour && current.minute < to.value.minute))
        return true;
      return false;
    }
  }

  @override
  void onInit() {
    from = StorageController().fromSleepDate.obs;
    to =  StorageController().toSleepDate.obs;
    super.onInit();
  }

}