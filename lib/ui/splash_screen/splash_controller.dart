import 'dart:async';

import 'package:get/get.dart';
import 'package:reminder/uitls/routes/app_pages.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() async {
    super.onInit();
    setInit();
  }
  static setInit() async{
    await startTimer();}

  static startTimer()async {
    Timer(
        Duration(seconds:5),
            () {
          Get.offNamed( AppPages().initialRoute());
        });
  }


}
