
import 'package:get/get.dart';
import 'package:reminder/ui/splash_screen/splash_controller.dart';

class SplashScreenBinding implements  Bindings{

  @override
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());



  }

}