import 'package:ecommerce/data/models/products_details.dart';
import 'package:ecommerce/presentation/state_holders/add_to_cart_controller.dart';
import 'package:ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:ecommerce/presentation/state_holders/products_details_controller.dart';
import 'package:ecommerce/presentation/ui/screen/review_showing_screen.dart';
import 'package:ecommerce/presentation/ui/widgets/bottom_price_details_and_button.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:ecommerce/presentation/ui/widgets/favorite_loveIcon_button.dart';
import 'package:ecommerce/presentation/ui/widgets/products_carousel_slider.dart';
import 'package:ecommerce/presentation/ui/widgets/products_details_screen_widgets/products_details_color_selector.dart';
import 'package:ecommerce/presentation/ui/widgets/products_details_screen_widgets/products_details_size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final int productsId;

  const ProductsDetailsScreen({super.key, required this.productsId});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductsDetailsController>()
          .getProductsDetails(widget.productsId);
    });
  }

  // ignore: unused_field
  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Products Details", true),
      body: GetBuilder<ProductsDetailsController>(
        builder: (productsDetailsController) {
          return Column(
            children: [
              ProductsDetailsCarouselSlider(
                imageList: [
                  productsDetailsController.productsDetails.img1 ?? "",
                  productsDetailsController.productsDetails.img2 ?? "",
                  productsDetailsController.productsDetails.img3 ?? "",
                  productsDetailsController.productsDetails.img4 ?? "",
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: productsDetails(
                        productsDetailsController.productsDetails,
                        productsDetailsController.availableColor),
                  ),
                ),
              ),
              GetBuilder<AddToCartController>(
                builder: (addToCartController) {
                  if (addToCartController.addToCartInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return BottomPriceDetailsAndButton(
                    priceText: 'Price',
                    actualPrice:
                        '\$${productsDetailsController.productsDetails.product?.price ?? ""}',
                    buttonText: 'Add To Cart',
                    whatWillHappenWhenPressTheButton: () async {
                      final results = await addToCartController.addToCart(
                          productsDetailsController.productsDetails.id!,
                          productsDetailsController.availableColor.toString(),
                          productsDetailsController.productsDetails.size!);
                      if (results) {
                        Get.snackbar('done', "add to cart done!");
                      } else if (AuthController.accessToken!.isEmpty) {
                        Get.defaultDialog(
                            title: "Login",
                            content: const Text(
                                "To confirm your order, you need to login first"),
                            onCancel: () {
                              Get.back();
                            },
                            onConfirm: () {
                              AuthController.clear();
                            });
                      }
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Column productsDetails(ProductsDetails productsDetails, List<String> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                productsDetails.product?.title ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.7,
                ),
              ),
            ),
            CustomStepper(
              stepValue: 1,
              lowerLimit: 1,
              upperLimit: 20,
              value: 1,
              onChanged: (value) {},
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '${productsDetails.product?.star ?? ""}',
              style: const TextStyle(
                fontSize: 15,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(
                  const ReviewsScreen(),
                );
              },
              child: const Text(
                "Review",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
            const FavoriteLoveIconButton(),
          ],
        ),
        const Text(
          "Color",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        const SizedBox(
          height: 16,
        ),
        ProductsDetailsColorSelector(
          colorCodes: productsDetails.color?.split(',') ?? [],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Sizes",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        const SizedBox(
          height: 16,
        ),
        ProductsDetailsSizeSelector(
          sizes: productsDetails.size?.split(',') ?? [],
          onSelect: (int index) {
            _selectedSizeIndex = index;
          },
          initialSelected: 0,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Description",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        Text(
          productsDetails.des ?? "",
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
