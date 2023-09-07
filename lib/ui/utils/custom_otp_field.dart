import 'package:flutter/material.dart';

class CustomOtpField extends StatelessWidget {
  const CustomOtpField({super.key, required this.otpController});

  final TextEditingController otpController;
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
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (value){
                if(value.length == 1){
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
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (value){
                if(value.length == 1){
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
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (value){
                if(value.length == 1){
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
