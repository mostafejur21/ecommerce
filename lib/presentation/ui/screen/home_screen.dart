import 'package:ecommerce/presentation/state_holders/categories_controller.dart';
import 'package:ecommerce/presentation/state_holders/home_screen_slider_controller.dart';
import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/state_holders/new_products_controller.dart';
import 'package:ecommerce/presentation/state_holders/popular_products_controller.dart';
import 'package:ecommerce/presentation/state_holders/spacial_products_controller.dart';
import 'package:ecommerce/presentation/ui/screen/auth/email_verification_screen.dart';
import 'package:ecommerce/presentation/ui/screen/item_screen.dart';
import 'package:ecommerce/presentation/ui/utils/images_utils.dart';
import 'package:ecommerce/presentation/ui/widgets/app_bar_icons.dart';
import 'package:ecommerce/presentation/ui/widgets/categories_card.dart';
import 'package:ecommerce/presentation/ui/widgets/home_screen_widgets/home_screen_search_bar.dart';
import 'package:ecommerce/presentation/ui/widgets/home_screen_widgets/home_slider.dart';
import 'package:ecommerce/presentation/ui/widgets/products_card.dart';
import 'package:ecommerce/presentation/ui/widgets/shimmer_in_progress/shimmer_popular.dart';
import 'package:ecommerce/presentation/ui/widgets/shimmer_in_progress/shimmer_progress.dart';
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
              GetBuilder<HomeScreenSliderController>(builder: (controller) {
                if (controller.homeScreenSliderInProgress) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: ShimmerProgressForCarouselSlider(),
                    ),
                  );
                }
                return HomeSlider(
                  sliders: controller.homeScreenSliderModel.data ?? [],
                );
              }),
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
              GetBuilder<PopularProductsController>(builder: (controller) {

                return TitleHeaderAndSeeAllButton(
                  title: "Popular",
                  onTap: () {
                    Get.to(
                      ItemsScreen(
                        title: 'Popular',
                        products: controller.productModel,
                      ),
                    );
                  },
                );
              }),
              popularItemsListView,
              GetBuilder<SpecialProductsController>(
                  builder: (specialController) {
                return TitleHeaderAndSeeAllButton(
                  title: "Special",
                  onTap: () {
                    Get.to(
                      ItemsScreen(
                        title: 'Special',
                        products: specialController.productModel,
                      ),
                    );
                  },
                );
              }),
              specialItemListView,
              GetBuilder<NewProductsController>(builder: (newController) {
                return TitleHeaderAndSeeAllButton(
                  title: "New",
                  onTap: () {
                    Get.to(
                      ItemsScreen(
                        title: 'New',
                        products: newController.productModel,
                      ),
                    );
                  },
                );
              }),
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
      child: GetBuilder<NewProductsController>(builder: (newController) {
        if (newController.getNewInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          addAutomaticKeepAlives: true,
          scrollDirection: Axis.horizontal,
          itemCount: newController.productModel.data?.length ?? 0,
          itemBuilder: (context, index) {
            return ProductsCard(
              product: newController.productModel.data![index],
              isShowDeleteButton: false,
            );
          },
        );
      }),
    );
  }

  SizedBox get specialItemListView {
    return SizedBox(
      height: 182,
      child: GetBuilder<SpecialProductsController>(
        builder: (specialController) {
          if (specialController.getSpecialProductsInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            addAutomaticKeepAlives: true,
            scrollDirection: Axis.horizontal,
            itemCount: specialController.productModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              return ProductsCard(
                product: specialController.productModel.data![index],
                isShowDeleteButton: false,
              );
            },
          );
        },
      ),
    );
  }

  SizedBox get popularItemsListView {
    return SizedBox(
      height: 182,
      child: GetBuilder<PopularProductsController>(
          builder: (popularProductsController) {
        if (popularProductsController.getPopularProductsInProgress) {
          return const Row(
            children: [
              ShimmerPopular(height: 160, width: 150,),
              ShimmerPopular(height: 160, width: 150,),
            ],
          );
        }
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularProductsController.productModel.data?.length ?? 0,
          itemBuilder: (context, index) {
            return ProductsCard(
              product: popularProductsController.productModel.data![index],
              isShowDeleteButton: false,
            );
          },
        );
      }),
    );
  }

  SizedBox get allCategoriesCardListView {
    return SizedBox(
      height: 90,
      child: GetBuilder<CategoriesController>(builder: (categoriesController) {
        return ListView.builder(
          itemCount: categoriesController.categoryModel.data?.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            return CategoriesCard(
              categoryData: categoriesController.categoryModel.data![index],
            );
          },
        );
      }),
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
            onTap: () {
              Get.to(() => const EmailVerificationScreen());
            },
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
