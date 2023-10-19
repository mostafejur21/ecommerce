import 'package:ecommerce/presentation/state_holders/authentication_controller/complete_profile_controller.dart';
import 'package:ecommerce/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:ecommerce/presentation/ui/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: SvgPicture.asset(ImagesUtils.craftyBayLogoSVG,
                        width: 100),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Complete Profile",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Get start with us by providing your details",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "please Enter your first name";
                      } else {
                        return null;
                      }
                    },
                    controller: _firstNameTEController,
                    decoration: const InputDecoration(labelText: "First Name"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "please Enter your last name";
                      } else {
                        return null;
                      }
                    },
                    controller: _lastNameTEController,
                    decoration: const InputDecoration(labelText: "Last Name"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[0-9]{11}$') /*this is another regex validation for number (r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')*/
                              .hasMatch(value)) {
                        return "please Enter your correct phone Number";
                      } else {
                        return null;
                      }
                    },
                    controller: _mobileTEController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Mobile"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _cityTEController,
                    decoration: const InputDecoration(labelText: "city"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _shippingAddressTEController,
                    maxLines: 3,
                    decoration:
                        const InputDecoration(labelText: "shipping address"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<CompleteProfileController>(
                        builder: (controller) {
                      if (controller.completeProfileInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          /*_firstNameTEController.clear();
                            _lastNameTEController.clear();
                            _cityTEController.clear();
                            _mobileTEController.clear();
                            _shippingAddressTEController.clear();*/
                          controller.getCompleteProfile(
                              _firstNameTEController.text.trim(),
                              _lastNameTEController.text.trim(),
                              _mobileTEController.text.trim(),
                              _cityTEController.text,
                              _shippingAddressTEController.text.trim());
                          if (_formKey.currentState!.validate()) {
                            // OTPVerifyLoginController().setProfile;
                            Get.offAll(() => const BottomNavBarScreen());
                          }
                        },
                        child: const Text("Complete"),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
