import 'package:flutter/material.dart';

class CustomOtpField extends StatelessWidget {
  const CustomOtpField(
      {super.key,
      required this.otpController1,
      required this.otpController2,
      required this.otpController3,
      required this.otpController4});

  final TextEditingController otpController1;
  final TextEditingController otpController2;
  final TextEditingController otpController3;
  final TextEditingController otpController4;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter the correct otp code";
                } else {
                  return null;
                }
              },
              controller: otpController1,
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.titleLarge,
              decoration: const InputDecoration(counterText: ""),
            ),
          ),
          SizedBox(
            height: 60,
            width: 60,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter the correct otp code";
                } else {
                  return null;
                }
              },
              controller: otpController2,
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.titleLarge,
              decoration: const InputDecoration(counterText: ""),
            ),
          ),
          SizedBox(
            height: 60,
            width: 60,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter the correct otp code";
                } else {
                  return null;
                }
              },
              controller: otpController3,
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.titleLarge,
              decoration: const InputDecoration(counterText: ""),
            ),
          ),
          SizedBox(
            height: 60,
            width: 60,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter the correct otp code";
                } else {
                  return null;
                }
              },
              controller: otpController4,
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              // onChanged: (value){
              //   if(value.length == 1){
              //     FocusScope.of(context).nextFocus();
              //   }
              // },
              style: Theme.of(context).textTheme.titleLarge,
              decoration: const InputDecoration(counterText: ""),
            ),
          ),
        ],
      ),
    );
  }
}
