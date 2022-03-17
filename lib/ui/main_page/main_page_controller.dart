import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:reminder/main.dart';
import 'package:reminder/ui/main_page/widgets/drop_down_list_controller.dart';
import 'package:reminder/ui/main_page/widgets/switch_button.dart';
import 'package:reminder/uitls/constants/constants.dart';
import 'package:reminder/uitls/storage_controller.dart';
import 'package:reminder/uitls/utils.dart';

class MainPageController extends GetxController{

  Rx<TimeOfDay> from = TimeOfDay(hour: 22,minute: 0).obs;
  Rx<TimeOfDay> to =  TimeOfDay(hour: 12,minute: 0).obs;
  RxString selectedTime = ''.obs;
  RxString selectedVoice = ''.obs;

  SwitchButtonController voiceController = SwitchButtonController(
    name: "تنبيه الصوت".tr,
    ison: StorageController().voiceSwitchButton,
  );

  SwitchButtonController notificationController = SwitchButtonController(
    name: "تنبيه الاشعارات".tr,
    ison: StorageController().notificationSwitchButton,);

  SwitchButtonController sleepController = SwitchButtonController(
      name: "عدم الازعاج اثناء النوم".tr,
      ison: StorageController().sleepSwitchButton,);

  AppDropdownButtonController times = AppDropdownButtonController(
      items: Constants.ALARM_TIME.keys.toList().obs,
      selectedItem: '');

  AppDropdownButtonController voices = AppDropdownButtonController(items: Constants.VOICE_TYPE.toList().obs,
    selectedItem: '',
  );


  selectFromTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: from.value,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != from.value)
    {
      /*if(from.value.hour > to.value.hour)
        Utils.openSnackBar(title: "error", message: "error in  selected time");
      else if(from.value.hour == to.value.hour)
        if(from.value.minute > to.value.minute)
          Utils.openSnackBar(title: "error", message: "error in  selected time");
        else*/
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
     /* if(from.value.hour > to.value.hour)
        Utils.openSnackBar(title: "error", message: "error in  selected time");
      else if(from.value.hour == to.value.hour)
        if(from.value.minute > to.value.minute)
          Utils.openSnackBar(title: "error", message: "error in  selected time");
        else*/
      to.value = timeOfDay;
    }
  }

  toggleNotification(val){
    StorageController().notificationSwitchButton = val;
  }

  toggleVoice(val){
    StorageController().voiceSwitchButton = val;
  }

  timeOnChange(val){

      scheduleAlarm(DateTime.now().add(Duration(seconds: Constants.ALARM_TIME[val])));
      selectedTime.value = val;
     setTimer(val);

  }

  setTimer(val){
    Timer(
        Duration(seconds: Constants.ALARM_TIME[val]),
            () {
          ///TODO CHECK IF IT IS TIME TO SLEEP
         /* if(DateTime.now().isAfter(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,from.value.hour, from.value.minute))
          && DateTime.now().isBefore(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,to.value.hour, to.value.minute))
          ){}
          else*/
          scheduleAlarm(DateTime.now());
          if(selectedTime.value  == val)
             setTimer(val);
        });
  }

  voiceOnChange(val){
    selectedVoice.value = val.obs;
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

}