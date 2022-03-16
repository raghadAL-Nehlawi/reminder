import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: Get.width,
        height: 100,
      decoration: BoxDecoration(image:DecorationImage(  image: AssetImage("assets/images/header.png"),fit: BoxFit.fill) )

    );
  }
}