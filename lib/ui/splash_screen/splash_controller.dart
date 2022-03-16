import 'package:get/get.dart';
import 'package:reminder/uitls/routes/app_pages.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() async {
    super.onInit();
      Get.toNamed(AppRoutes.MAIN_PAGE);
  }

}
