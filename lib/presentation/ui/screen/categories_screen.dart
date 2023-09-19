import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/ui/widgets/categories_card.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHomeScreen();
        return false;
      },
      child: Scaffold(
        appBar: customAppBar("Categories", false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: gridViewForCategories,
        ),
      ),
    );
  }

  GridView get gridViewForCategories {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, int index) {
        return const FittedBox(
          child: CategoriesCard(),
        );
      },
    );
  }
}
