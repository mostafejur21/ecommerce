import 'package:ecommerce/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
    );
  }
}
