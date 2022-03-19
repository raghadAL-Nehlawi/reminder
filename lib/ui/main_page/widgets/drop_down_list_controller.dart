import 'package:get/get.dart';

class AppDropdownButtonController extends GetxController
{
  RxList<String> items;
  RxString _selectedItem = ''.obs;
  String get selectedItem => _selectedItem.value;

  selectItem(val) {
    _selectedItem.value = val;
  }

  AppDropdownButtonController(
      { this.items, String selectedItem}) {
    _selectedItem = selectedItem.obs ?? ''.obs;
  }
}