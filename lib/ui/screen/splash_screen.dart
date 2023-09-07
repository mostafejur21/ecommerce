import 'package:ecommerce/ui/screen/auth/email_verification_screen.dart';
import 'package:ecommerce/ui/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    goToNextScreen();
    super.initState();
  }

  void goToNextScreen(){
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.offAll(const EmailVerificationScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SvgPicture.asset(ImagesUtils.craftyBayLogoSVG, width: 100),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 10,
          ),
          const Text("Version 1.0.0"),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
