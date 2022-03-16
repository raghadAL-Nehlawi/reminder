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
      ReadWriteValue(Constants.VOICE_SWITCH_BUTTON, false);


  bool get notificationSwitchButton => _notificationSwitchButton.val;
  bool get voiceSwitchButton => _voiceSwitchButton.val;
  bool get sleepSwitchButton => _voiceSwitchButton.val;


  set notificationSwitchButton(bool value) => _notificationSwitchButton.val = value;
  set voiceSwitchButton(bool value) => _voiceSwitchButton.val = value;
  set sleepSwitchButton(bool value) => _sleepSwitchButton.val = value;


}