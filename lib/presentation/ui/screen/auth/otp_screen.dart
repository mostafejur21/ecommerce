import 'dart:async';
import 'package:ecommerce/presentation/state_holders/verify_login_controller.dart';
import 'package:ecommerce/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:ecommerce/presentation/ui/utils/images_utils.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_otp_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  // ignore: unused_field
  final TextEditingController _otpTEController = TextEditingController();
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

  int timeLeft = 10;
  bool wait = false;

  void startTimer() {
    const sec = Duration(seconds: 1);
    // ignore: unused_local_variable
    Timer timer = Timer.periodic(sec, (timer) {
      if (timeLeft == 0) {
        setState(() {
          timer.cancel();
          wait = true;
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
        child: SingleChildScrollView(
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
                // PinCodeTextField(
                //   controller: _otpTEController,
                //   length: 4,
                //   obscureText: false,
                //   animationType: AnimationType.fade,
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   keyboardType: TextInputType.number,
                //   pinTheme: PinTheme(
                //     shape: PinCodeFieldShape.box,
                //     borderRadius: BorderRadius.circular(5),
                //     fieldHeight: 50,
                //     fieldWidth: 50,
                //     activeFillColor: Colors.white,
                //     inactiveFillColor: Colors.white,
                //     selectedFillColor: Colors.white,
                //     activeColor: AppColor.primaryColor,
                //     inactiveColor: AppColor.primaryColor,
                //     selectedColor: Colors.green,
                //   ),
                //   animationDuration: const Duration(milliseconds: 300),
                //   enableActiveFill: true,
                //   onCompleted: (v) {},
                //   onChanged: (value) {},
                //   beforeTextPaste: (text) {
                //     return true;
                //   },
                //   appContext: context,
                // ),
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
                  child: GetBuilder<OTPVerifyLoginController>(
                    builder: (controller) {
                      if(controller.verifyLoginInProgress){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      return ElevatedButton(
                        onPressed: () async {
                          verifyOtp(controller);
                          // if (_otpController1.text.isEmpty &&
                          //     _otpController2.text.isEmpty &&
                          //     _otpController3.text.isEmpty &&
                          //     _otpController4.text.isEmpty) {
                          //
                          // } else {
                          //   Get.to(const CompleteProfileScreen());
                          // }
                          // _otpController1.clear();
                          // _otpController2.clear();
                          // _otpController3.clear();
                          // _otpController4.clear();
                          // Get.offAll(const CompleteProfileScreen());
                        },
                        child: const Text("Next"),
                      );
                    }
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
                          style: TextStyle(
                              color: timeLeft == 0
                                  ? Colors.grey
                                  : AppColor.primaryColor,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (wait) {
                      startTimer();
                      if(mounted){
                        setState(() {
                        });
                      }
                      Get.snackbar(
                          "Otp resend success", "we have send you another otp");
                    } else {
                      Get.snackbar("Wait", "please wait");
                    }
                  },
                  child: Text(
                    "Resend",
                    style: wait == false
                        ? const TextStyle(color: Colors.grey)
                        : const TextStyle(color: AppColor.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> verifyOtp(OTPVerifyLoginController controller)async{
    final String otp = "${_otpController1.text.trim()}${_otpController2.text.trim()}${_otpController3.text.trim()}${_otpController4.text.trim()}";
    final response = await controller.verifyLogin(widget.email,otp);
    if(response){
      Get.to(()=> const BottomNavBarScreen());
    }else{
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: "Enter the correct otp",
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
}
