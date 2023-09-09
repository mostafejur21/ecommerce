import 'dart:async';

import 'package:ecommerce/ui/screen/auth/complete_profile_screen.dart';
import 'package:ecommerce/ui/screen/home_screen.dart';
import 'package:ecommerce/ui/utils/app_color.dart';
import 'package:ecommerce/ui/utils/custom_otp_field.dart';
import 'package:ecommerce/ui/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  int timeLeft = 120;
  bool wait = false;

  void startTimer() {
    const sec = Duration(seconds: 1);
    Timer timer = Timer.periodic(sec, (timer) {
      if (timeLeft == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child:
                    SvgPicture.asset(ImagesUtils.craftyBayLogoSVG, width: 100),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Enter OTP Code",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "A 4 digit otp code has been sent",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: _formKey,
                child: CustomOtpField(
                  otpController1: _otpController1,
                  otpController2: _otpController2,
                  otpController3: _otpController3,
                  otpController4: _otpController4,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_otpController1.text.isEmpty &&
                        _otpController2.text.isEmpty &&
                        _otpController3.text.isEmpty &&
                        _otpController4.text.isEmpty) {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "Error",
                          message: "Enter the correct otp",
                          duration: Duration(seconds: 1),
                        ),
                      );
                    } else {
                      Get.to(const CompleteProfileScreen());
                    }
                    _otpController1.clear();
                    _otpController2.clear();
                    _otpController3.clear();
                    _otpController4.clear();
                    // Get.offAll(const CompleteProfileScreen());
                  },
                  child: const Text("Next"),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.grey),
                  children: [
                    const TextSpan(text: "This code will expire in "),
                    TextSpan(
                        text: "${timeLeft}s",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Resend",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
