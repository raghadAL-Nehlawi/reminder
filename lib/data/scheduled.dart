import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:reminder/main.dart';
import 'package:reminder/uitls/storage_controller.dart';

class Scheduled{
  static TimeOfDay from = StorageController().fromSleepDate;
  static TimeOfDay to = StorageController().toSleepDate;



  static bool checkIfItIsSleepTime(TimeOfDay current,){
    if(from.hour > to.hour || (from.hour == to.hour && from.minute > to.minute)) /// 22 - 10
    {
      if(current.hour <= 12)
      {
        if((current.hour > from.hour || (from.hour == current.hour && from.minute < current.minute)) )
          return true;
        return false;
      }
      else if (current.hour < to.hour || (to.hour == current.hour && to.minute > current.minute))
        return true;
      return false;
    }
    else /// 1 - 12
    {
      if(from.hour == to.hour && current.hour ==  to.hour) /// 12.1 - 12.54
      {
        if(current.minute > from.minute && current.minute < to.minute)
          return true;
      }
      else if((current.hour > from.hour && current.hour < to.hour)
          || (current.hour == from.hour && current.minute > from.minute)
          || (current.hour == to.hour && current.minute < to.minute))
        return true;
      return false;
    }
  }


  static void scheduleAlarm(DateTime scheduledNotificationDateTime) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'Channel for Alarm notification',
      playSound:  StorageController().voiceSwitchButton,
      icon: '@mipmap/launcher_icon',
      sound: RawResourceAndroidNotificationSound(StorageController().voiceAlarm == "type1"? "a": "b"),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),
    );

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(0, 'تذكير', "تذكير ",
        scheduledNotificationDateTime, platformChannelSpecifics);
  }

 static bool notificationIsOn(){
    if(!StorageController().notificationSwitchButton ||
        (StorageController().sleepSwitchButton && checkIfItIsSleepTime(TimeOfDay.now())))
      return false;
    return true;
}

}