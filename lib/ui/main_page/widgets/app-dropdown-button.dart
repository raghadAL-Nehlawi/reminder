import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/uitls/constants/colors.dart';
import 'package:reminder/uitls/constants/textStyles.dart';

import 'drop_down_list_controller.dart';


class AppDropdownButton extends StatelessWidget {
  final AppDropdownButtonController controller;
  final Function onChange;

  const AppDropdownButton({this.controller, this.onChange});

  @override
  Widget build(BuildContext context) {

    return Obx(
      () => Container(
        height: 40,
        width: Get.width/2,
    //    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10) ,
            color: AppColors.secondaryColor),
        child: DropdownButton<String>(
          focusColor:  AppColors.primaryColor,
          borderRadius: BorderRadius.circular(6),
          isExpanded: true,
         // isDense: false,
          dropdownColor: Colors.grey[50],
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.primaryColor,
              ),
          ),

          hint: Padding(
            padding: const EdgeInsets.all(8.0),

            child: Text(controller.selectedItem,
                style: AppTextStyle.openSansLargePrimary),
          ),
          items: controller.items.map((String value) {
            return DropdownMenuItem<String>(

                value: value,
                child: DropdownItem(value: value, isSelected: false));
          }).toList(),
          onChanged: (val) {
            controller.selectItem(val);
            onChange(val);
          },
        ),
      ),
    );
  }
}




class DropdownItem extends StatelessWidget {
  final String value;
  final bool isSelected;

  const DropdownItem({this.value, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(value,
        style: TextStyle(
            color: isSelected ? Colors.white : AppColors.secondaryColor));
  }
}






