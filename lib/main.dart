import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reminder/ui/splash_screen/splash_binding.dart';
import 'package:reminder/uitls/dependency_injection.dart';
import 'package:reminder/uitls/routes/app_pages.dart';
import 'package:reminder/uitls/utils.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');


  var initializationSettings = InitializationSettings(
    android:
      initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String payload) async {
        if (payload != null) {
          debugPrint('notification payload: ' + payload);
        }
      });
  await DependencyInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminder',
      theme: Utils.appTheme,
      getPages: AppPages().getPages(),
      initialRoute:  AppRoutes.SPLASH,
      initialBinding: SplashScreenBinding(),
    );
  }
}
