import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/uitls/constants/colors.dart';
import 'package:reminder/uitls/constants/textStyles.dart';

class SwitchButton extends StatelessWidget {
  final SwitchButtonController controller;
  final TextStyle style;
  const SwitchButton({Key key, this.controller, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text(controller.name, style: style ?? AppTextStyle.openSansLargeWhiteBold,),
           Obx(() =>
             Switch.adaptive(
               splashRadius: 20,
              onChanged: (val) {
                controller.toggle();
               controller.onChange(val);
              },
              value: controller.isOn,
              activeColor: AppColors.switchOnBackgroundButton,
              activeTrackColor: Colors.white,
              inactiveThumbColor: AppColors.switchOffBackgroundButton,
              inactiveTrackColor: Colors.grey[300],


           ))
        ],
      ),
    );
  }
}















class SwitchButtonController extends GetxController{
  final String name;
   RxBool _on = false.obs;
   Function onChange;
  SwitchButtonController({bool ison = false, this.onChange, this.name}) {

    this._on = ison.obs;
  }

  get isOn => _on.value == true;

  get toggle => _on.toggle();

  get on => _on.value = true;

  get off => _on.value = false;
}