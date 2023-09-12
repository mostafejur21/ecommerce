import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/application/apps.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    DevicePreview(
      builder: (context) => const CraftyBay(),
    ),
  );
}