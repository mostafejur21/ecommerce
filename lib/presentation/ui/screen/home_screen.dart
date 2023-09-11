import 'package:ecommerce/presentation/ui/screen/categories_screen.dart';
import 'package:ecommerce/presentation/ui/utils/images_utils.dart';
import 'package:ecommerce/presentation/ui/widgets/app_bar_icons.dart';
import 'package:ecommerce/presentation/ui/widgets/categories_card.dart';
import 'package:ecommerce/presentation/ui/widgets/home_screen_widgets/home_carousel_slider.dart';
import 'package:ecommerce/presentation/ui/widgets/home_screen_widgets/home_screen_search_bar.dart';
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
      appBar: AppBar(
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
      ),
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
                  Get.to(
                    const CategoriesScreen(),
                  );
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      return const CategoriesCard();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
