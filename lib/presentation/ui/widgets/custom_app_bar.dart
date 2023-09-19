import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
AppBar customAppBar(String title, bool willPopWhenPressTheDefaultBackButton) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
      onPressed: () {
        willPopWhenPressTheDefaultBackButton == false ? Get.find<MainBottomNavController>().backToHomeScreen()
          : Get.back();
        },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    ),
  );
}
