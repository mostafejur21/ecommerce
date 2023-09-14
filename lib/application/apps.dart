import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/application/state_holders_bindings.dart';
import 'package:ecommerce/presentation/ui/screen/splash_screen.dart';
import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      useInheritedMediaQuery: true,
      //for devices preview
      locale: DevicePreview.locale(context),
      ////for devices preview
      builder: DevicePreview.appBuilder,
      //for devices preview
      initialBinding: StateHoldersBindings(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch:
            MaterialColor(AppColor.primaryColor.value, AppColor().color),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: const OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
                fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
