import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:reminder/main.dart';
import 'package:reminder/ui/main_page/widgets/drop_down_list_controller.dart';
import 'package:reminder/ui/main_page/widgets/switch_button.dart';
import 'package:reminder/uitls/constants/constants.dart';
import 'package:reminder/uitls/storage_controller.dart';

class MainPageController extends GetxController{

  Rx<TimeOfDay> from = TimeOfDay.now().obs;
  Rx<TimeOfDay> to = TimeOfDay.now().obs;
  RxString selectedTime = ''.obs;
  RxString selectedVoice = ''.obs;


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



  SwitchButtonController voiceController = SwitchButtonController(
      name: "تنبيه الصوت".tr,
      ison: StorageController().voiceSwitchButton,
      onChange: (){});


  SwitchButtonController notificationController = SwitchButtonController(
      name: "تنبيه الاشعارات".tr,
      ison: StorageController().notificationSwitchButton,
      onChange: (){});

  SwitchButtonController sleepController = SwitchButtonController(
      name: "عدم الازعاج اثناء النوم".tr,
      ison: StorageController().sleepSwitchButton,
      onChange: (){});

  AppDropdownButtonController times = AppDropdownButtonController(
                                          items: Constants.ALARM_TIME.keys.toList().obs,
                                          selectedItem: '');

  AppDropdownButtonController voices = AppDropdownButtonController(items: Constants.VOICE_TYPE.toList().obs,
  selectedItem: '',
  );

  timeOnChange(val){

      scheduleAlarm(DateTime.now().add(Duration(seconds: Constants.ALARM_TIME[selectedTime.value])));

    selectedTime.value = val;
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
      sound: RawResourceAndroidNotificationSound(voices.selectedItem == "type1"? "1": "2"),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),
    );

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(0, 'تذكير', "تذكير ",
        scheduledNotificationDateTime, platformChannelSpecifics);
  }

}