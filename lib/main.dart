import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reminder/ui/splash_screen/splash_binding.dart';
import 'package:reminder/uitls/constants/constants.dart';
import 'package:reminder/uitls/dependency_injection.dart';
import 'package:reminder/uitls/routes/app_pages.dart';
import 'package:reminder/uitls/storage_controller.dart';
import 'package:reminder/uitls/utils.dart';
import 'package:workmanager/workmanager.dart';

import 'data/scheduled.dart';


const String TAG = "BackGround_Work";
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();




void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  ///INIT LOCAL NOTIFICATION
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

  /// INIT BACKGROUND SERVICE
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode: true,

  );
  Workmanager().registerPeriodicTask(
      "2",
      "registerPeriodicTask",
      initialDelay: Duration(seconds: 40),
      frequency:  Duration(minutes: Constants.ALARM_TIME[StorageController().timeAlarm]),
    inputData: {}

  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

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



void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print(TAG + "callbackDispatcher");
    if(Scheduled.notificationIsOn())
       await  Scheduled.scheduleAlarm(DateTime.now());
    return Future.value(true);
  });
}