import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';
import 'constants/textStyles.dart';

class Utils {
  static final categoryItemWidth = Get.width * 0.44;
  static final categoryItemHeight = 242.0;
  static final productItemWidth = (Get.width / 2) - 22;
  static final productItemHeight = 218.0;

  static final appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    cursorColor: AppColors.secondaryColor,
    unselectedWidgetColor: AppColors.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppTextStyle.robotoRegularWhite,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.zero,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.zero,
      ),
    ),
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.secondaryColor,
    // appBarTheme: AppBarTheme(
    //   color: AppColors.white,
    //   centerTitle: false,
    //   brightness: Brightness.light,
    //   actionsIconTheme: IconThemeData(color: AppColors.primaryColor),
    //   iconTheme: IconThemeData(color: AppColors.primaryColor),
    // ),
  );

  static void changeStatusBarColor(Color color,
      {Brightness brightness = Brightness.dark}) {
    print('status bar changed');
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: brightness,
    ));
  }

  static void openSnackBar({String title = '', String message = ''}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey,
        colorText: AppColors.white);
  }


  static void closeDialog() {
    if (Get.isDialogOpen) {
      Get.back();
    }
  }


  static DateTime currentBackPressTime;

  static Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      openSnackBar(title: 'BackToExit'.tr);
      return Future.value(false);
    }
    return Future.value(true);
  }

}
