import 'package:ecommerce/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/images_utils.dart';

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
                    controller: _firstNameTEController,
                    decoration: const InputDecoration(labelText: "First Name"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _lastNameTEController,
                    decoration: const InputDecoration(labelText: "Last Name"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
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
                    child: ElevatedButton(
                      onPressed: () {
                        _firstNameTEController.clear();
                        _lastNameTEController.clear();
                        _cityTEController.clear();
                        _mobileTEController.clear();
                        _shippingAddressTEController.clear();
                        if(_formKey.currentState != null){
                          Get.offAll(const HomeScreen());
                        }
                      },
                      child: const Text("Complete"),
                    ),
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
