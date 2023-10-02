import 'package:ecommerce/presentation/state_holders/categories_controller.dart';
import 'package:ecommerce/presentation/state_holders/home_screen_slider_controller.dart';
import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/state_holders/new_products_controller.dart';
import 'package:ecommerce/presentation/state_holders/popular_products_controller.dart';
import 'package:ecommerce/presentation/state_holders/spacial_products_controller.dart';
import 'package:ecommerce/presentation/ui/screen/cart_screen.dart';
import 'package:ecommerce/presentation/ui/screen/categories_screen.dart';
import 'package:ecommerce/presentation/ui/screen/home_screen.dart';
import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'wish_list_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeScreenSliderController>().getHomeScreenSlider();
      Get.find<CategoriesController>().getCategories();
      Get.find<PopularProductsController>().getPopularProducts();
      Get.find<NewProductsController>().getNewProducts();
      Get.find<SpecialProductsController>().getSpecialProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: screens[controller.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentSelectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColor.primaryColor,
            showSelectedLabels: true,
            type: BottomNavigationBarType.shifting,
            elevation: 4,
            onTap: controller.onChanged,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "Home", tooltip: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.square_grid_2x2), label: "Category"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.gift), label: "Wish"),
            ],
          ),
        );
      }
    );
  }
}
