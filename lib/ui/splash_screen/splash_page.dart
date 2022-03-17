
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/ui/splash_screen/splash_controller.dart';
import 'package:reminder/uitls/routes/app_pages.dart';


class SplashScreenPage extends GetView<SplashScreenController>  {


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: 'assets/images/splash.png',

      screenFunction: () async{
        return Get.toNamed(await AppPages().initialRoute());
      },
      duration: 2,
      splashTransition: SplashTransition.rotationTransition,

    );
  }

}
