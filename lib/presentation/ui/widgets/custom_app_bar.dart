import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBar(bool showBackButton, String title) {
  return AppBar(
    title: Text(title),
    leading: showBackButton == true ? IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    ) : null,
  );
}
