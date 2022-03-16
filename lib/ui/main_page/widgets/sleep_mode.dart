import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/ui/main_page/main_page_controller.dart';
import 'package:reminder/ui/main_page/widgets/switch_button.dart';
import 'package:reminder/uitls/constants/colors.dart';
import 'package:reminder/uitls/constants/textStyles.dart';

class SleepMode extends GetWidget<MainPageController> {

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.all(16),
      padding:  EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryColor
      ),
      child: Obx(() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SwitchButton(controller: controller.sleepController,style: AppTextStyle.openSansLargePrimary,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration( color: Colors.grey,borderRadius: BorderRadius.circular(10) ),

                    child: Text(controller?.from?.value.hour.toString() +":" + controller?.from?.value.minute.toString()?? "اختر وقت")),
                onTap: () => controller.selectFromTime(context),),
              Text("من الساعة")],),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration( color: Colors.grey,borderRadius: BorderRadius.circular(10) ),
                  child: Text(controller?.to?.value.hour.toString() +":" + controller?.to?.value.minute.toString()?? "اختر وقت"),
                ),
                onTap: () => controller.selectToTime(context),),
              Text("إلى الساعة")],)
        ],),
      ),
      ),

    );
  }
}
