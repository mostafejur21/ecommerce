import 'package:ecommerce/presentation/state_holders/categories_controller.dart';
import 'package:ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:ecommerce/presentation/state_holders/home_screen_slider_controller.dart';
import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/state_holders/new_products_controller.dart';
import 'package:ecommerce/presentation/state_holders/popular_products_controller.dart';
import 'package:ecommerce/presentation/state_holders/spacial_products_controller.dart';
import 'package:ecommerce/presentation/state_holders/verify_login_controller.dart';
import 'package:get/get.dart';

class StateHoldersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OTPVerifyLoginController());
    Get.put(HomeScreenSliderController());
    Get.put(CategoriesController());
    Get.put(PopularProductsController());
    Get.put(NewProductsController());
    Get.put(SpecialProductsController());
  }
}
