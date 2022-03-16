import 'package:get/get.dart';
import 'package:reminder/ui/main_page/main_page.dart';
import 'package:reminder/ui/main_page/main_page_binding.dart';
import 'package:reminder/ui/splash_screen/splash_binding.dart';
import 'package:reminder/ui/splash_screen/splash_page.dart';

part './app_routes.dart';

class AppPages {
  List<GetPage> getPages() {
    return [
      GetPage(name: AppRoutes.SPLASH, page: () => SplashScreenPage(), binding: SplashScreenBinding()),
      GetPage(name: AppRoutes.MAIN_PAGE, page: () => MainPage(), binding: MainPageBinding()),

    ];
  }

  String initialRoute()  {
    return AppRoutes.MAIN_PAGE;

  }


}
