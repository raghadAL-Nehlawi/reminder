
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/ui/main_page/main_page.dart';
import 'package:reminder/uitls/routes/app_pages.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreenPage extends GetView<SplashScreenPage>  {


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: 'assets/images/splash.png',

      screenFunction: () async{
      //  Get.toNamed( AppPages().initialRoute());
    //    return MainPage();
      },
      duration: 5,
      splashTransition: SplashTransition.rotationTransition,
      //pageTransitionType: PageTransitionType.scale,

    );
  }

}
