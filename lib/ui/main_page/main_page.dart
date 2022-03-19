import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/ui/main_page/main_page_controller.dart';
import 'package:reminder/ui/main_page/widgets/app-dropdown-button.dart';
import 'package:reminder/ui/main_page/widgets/header.dart';
import 'package:reminder/ui/main_page/widgets/sleep_mode.dart';
import 'package:reminder/ui/main_page/widgets/switch_button.dart';
import 'package:reminder/uitls/constants/colors.dart';
import 'package:reminder/uitls/constants/textStyles.dart';

class MainPage extends GetView<MainPageController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20,),
          HeaderWidget(),
          SwitchButton(controller: controller.voiceController,onChange: controller.toggleVoice),
          SwitchButton(controller: controller.notificationController,onChange: controller.toggleNotification,),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("وقت التنبيه".tr, style: AppTextStyle.openSansLargeWhiteBold,),
                AppDropdownButton(controller: controller.times,onChange: controller.timeOnChange,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("نوع الصوت".tr, style: AppTextStyle.openSansLargeWhiteBold,),
                AppDropdownButton(controller: controller.voices,onChange: controller.selectedVoice,),
              ],
            ),
          ),
          SleepMode()


      ],),),
    );
  }
}