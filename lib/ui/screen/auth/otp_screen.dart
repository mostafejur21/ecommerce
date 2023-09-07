import 'package:ecommerce/ui/screen/auth/complete_profile_screen.dart';
import 'package:ecommerce/ui/utils/custom_otp_field.dart';
import 'package:ecommerce/ui/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  otpController: _otpController,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(const CompleteProfileScreen());
                  },
                  child: const Text("Next"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
