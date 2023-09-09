import 'package:ecommerce/ui/screen/cart_screen.dart';
import 'package:ecommerce/ui/screen/categories_screen.dart';
import 'package:ecommerce/ui/screen/home_screen.dart';
import 'package:ecommerce/ui/screen/wish_list_screen.dart';
import 'package:ecommerce/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

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
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          selectedIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard_outlined), label: "Wish"),
        ],
      ),
    );
  }
}
