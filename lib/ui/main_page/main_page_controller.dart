import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      selectedTime.value = val;
     StorageController().timeAlarm = val;

  }

  voiceOnChange(val){
    selectedVoice.value = val.obs;
    StorageController().voiceAlarm = val;
  }




  @override
  void onInit() {
    from = StorageController().fromSleepDate.obs;
    to =  StorageController().toSleepDate.obs;
    super.onInit();
  }

}
