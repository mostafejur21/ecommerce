import 'package:ecommerce/presentation/ui/screen/cart_screen.dart';
import 'package:ecommerce/presentation/ui/screen/categories_screen.dart';
import 'package:ecommerce/presentation/ui/screen/home_screen.dart';
import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'wish_list_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColor.primaryColor,
        showSelectedLabels: true,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          selectedIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
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
}
