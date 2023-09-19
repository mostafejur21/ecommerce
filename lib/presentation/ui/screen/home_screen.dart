import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/ui/screen/new_item_screen.dart';
import 'package:ecommerce/presentation/ui/screen/popular_item_screen.dart';
import 'package:ecommerce/presentation/ui/screen/spacial_item_screen.dart';
import 'package:ecommerce/presentation/ui/utils/images_utils.dart';
import 'package:ecommerce/presentation/ui/widgets/app_bar_icons.dart';
import 'package:ecommerce/presentation/ui/widgets/categories_card.dart';
import 'package:ecommerce/presentation/ui/widgets/home_screen_widgets/home_carousel_slider.dart';
import 'package:ecommerce/presentation/ui/widgets/home_screen_widgets/home_screen_search_bar.dart';
import 'package:ecommerce/presentation/ui/widgets/products_card.dart';
import 'package:ecommerce/presentation/ui/widgets/title_header_and_see_all_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeScreenAppBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const HomeScreenSearchBar(),
              const SizedBox(
                height: 16,
              ),
              const HomeCarouselSlider(),
              const SizedBox(
                height: 16,
              ),
              TitleHeaderAndSeeAllButton(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().onChanged(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              allCategoriesCardListView,
              TitleHeaderAndSeeAllButton(
                title: "Popular",
                onTap: () {
                Get.to(const PopularItemScreen());
                },
              ),
              popularItemsListView,
              TitleHeaderAndSeeAllButton(
                title: "Spacial",
                onTap: () {
                  Get.to(const SpacialItemScreen());
                },
              ),
              spacialItemListView,
              TitleHeaderAndSeeAllButton(
                title: "New",
                onTap: () {
                  Get.to(const NewItemScreen());
                },
              ),
              newItemListView,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get newItemListView {
    return SizedBox(
              height: 182,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const ProductsCard();
                },
              ),
            );
  }

  SizedBox get spacialItemListView {
    return SizedBox(
              height: 182,
              child: ListView.builder(
                addAutomaticKeepAlives: true,
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const ProductsCard();
                },
              ),
            );
  }

  SizedBox get popularItemsListView {
    return SizedBox(
              height: 182,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const ProductsCard();
                },
              ),
            );
  }

  SizedBox get allCategoriesCardListView {
    return SizedBox(
              height: 90,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  return const CategoriesCard();
                },
              ),
            );
  }

  AppBar get homeScreenAppBar {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          SvgPicture.asset(ImagesUtils.craftyBayNavBarLogoSVG),
          const Spacer(),
          AppBarIcons(
            icon: Icons.person_outline,
            onTap: () {},
          ),
          const SizedBox(
            width: 12,
          ),
          AppBarIcons(
            icon: Icons.phone_outlined,
            onTap: () {},
          ),
          const SizedBox(
            width: 12,
          ),
          AppBarIcons(
            icon: Icons.notifications_active_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
