import 'package:get/get.dart';
import 'package:reminder/ui/main_page/main_page_controller.dart';

class MainPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainPageController());
  }

}