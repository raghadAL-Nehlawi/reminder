import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reminder/uitls/app_controller.dart';
import 'package:reminder/uitls/storage_controller.dart';

class DependencyInjection {
  static Future<void> init() async{
    print('init DependencyInjection');
    Get.put(AppController(),permanent: true);
    initProviders();
    initRepositories();
    await initGetStorage();
  }
}

void initProviders() {
  print('init Providers');


}

void initRepositories() {
  print('init RepositoriesService');

}

Future<void> initGetStorage() async {
  print('init GetStore');
  await GetStorage.init();
  StorageController storage=StorageController();

  return ;
}

