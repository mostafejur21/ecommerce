import 'package:ecommerce/ui/screen/auth/otp_screen.dart';
import 'package:ecommerce/ui/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
                "Welcome Back",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Please Enter your Email address",
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
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-.]+@([\w-]+\.)+\w{2,5}')
                            .hasMatch(value)) {
                      return "please Enter your correct Email";
                    } else {
                      return null;
                    }
                  },
                  controller: _emailTEController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(const OtpVerificationScreen());
                    }
                  },
                  child: const Text("NEXT"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
