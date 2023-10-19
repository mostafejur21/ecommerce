import 'package:ecommerce/presentation/state_holders/add_to_cart_controller.dart';
import 'package:ecommerce/presentation/state_holders/authentication_controller/verify_login_controller.dart';
import 'package:ecommerce/presentation/state_holders/cart_list_controller.dart';
import 'package:ecommerce/presentation/state_holders/categories_controller.dart';
import 'package:ecommerce/presentation/state_holders/authentication_controller/complete_profile_controller.dart';
import 'package:ecommerce/presentation/state_holders/create_review_controller.dart';
import 'package:ecommerce/presentation/state_holders/create_wish_list.dart';
import 'package:ecommerce/presentation/state_holders/delete_cart_list.dart';
import 'package:ecommerce/presentation/state_holders/authentication_controller/email_verification_controller.dart';
import 'package:ecommerce/presentation/state_holders/home_screen_slider_controller.dart';
import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/state_holders/new_products_controller.dart';
import 'package:ecommerce/presentation/state_holders/popular_products_controller.dart';
import 'package:ecommerce/presentation/state_holders/products_details_controller.dart';
import 'package:ecommerce/presentation/state_holders/products_wish_list_controller.dart';
import 'package:ecommerce/presentation/state_holders/read_profile_controller.dart';
import 'package:ecommerce/presentation/state_holders/review_list_controller.dart';
import 'package:ecommerce/presentation/state_holders/spacial_products_controller.dart';
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
    Get.put(ProductsDetailsController());
    Get.put(AddToCartController());
    Get.put(CompleteProfileController());
    Get.put(CartListController());
    Get.put(ProductsWishListController());
    Get.put(CreateWishListController());
    Get.put(ReviewListController());
    Get.put(CreateReviewController());
    Get.put(ReadProfileController());
    Get.put(DeleteCartListController());
  }
}
