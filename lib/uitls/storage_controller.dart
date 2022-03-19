import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'constants/constants.dart';

class StorageController {
  static StorageController _instance;

  factory StorageController() => _instance ??= StorageController._();

  StorageController._();


  var _notificationSwitchButton =
        ReadWriteValue(Constants.NOTIFICATION_SWITCH_BUTTON, false);
  var _voiceSwitchButton =
       ReadWriteValue(Constants.VOICE_SWITCH_BUTTON, false);
  var _sleepSwitchButton =
      ReadWriteValue(Constants.SLEEP_SWITCH_BUTTON, false);
  var _toSleepDate =
      ReadWriteValue(Constants.FROM_DATE_SLEEP, TimeOfDay(hour: 22,minute: 0));
  var _fromSleepDate =
      ReadWriteValue(Constants.TO_DATE_SLEEP, TimeOfDay(hour: 10,minute: 0));
  var _timeAlarm =
    ReadWriteValue(Constants.TIME_ALARM, Constants.ALARM_TIME.keys.first);
  var _voiceAlarm =
    ReadWriteValue(Constants.VOICE_ALARM, Constants.VOICE_TYPE[0]);


  bool get notificationSwitchButton => _notificationSwitchButton.val;
  bool get voiceSwitchButton => _voiceSwitchButton.val ;
  bool get sleepSwitchButton => _voiceSwitchButton.val;
  TimeOfDay get toSleepDate => _toSleepDate.val;
  TimeOfDay get fromSleepDate => _fromSleepDate.val;
  String get timeAlarm => _timeAlarm.val;
  String get voiceAlarm => _voiceAlarm.val;


  set notificationSwitchButton(bool value) => _notificationSwitchButton.val = value;
  set voiceSwitchButton(bool value) => _voiceSwitchButton.val = value;
  set sleepSwitchButton(bool value) => _sleepSwitchButton.val = value;
  set toSleepDate(TimeOfDay value) => _toSleepDate.val = value;
  set fromSleepDate(TimeOfDay value) => _fromSleepDate.val = value;
  set timeAlarm(String value) => _timeAlarm.val = value;
  set voiceAlarm(String value) => _voiceAlarm.val = value;


}
