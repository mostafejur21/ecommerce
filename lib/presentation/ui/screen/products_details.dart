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
  const ProductsDetailsScreen({super.key});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Products Details", true),
      body: Column(
        children: [
          const ProductsDetailsCarouselSlider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: productsDetails,
              ),
            ),
          ),
          BottomPriceDetailsAndButton(
            priceText: 'Price',
            actualPrice: '\$100.00',
            buttonText: 'Add To Cart',
            whatWillHappenWhenPressTheButton: () {},
          ),
        ],
      ),
    );
  }

  Column get productsDetails {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Adidas Shoe HK23454 - Black Edition",
                          style: TextStyle(
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
                      const Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(const ReviewsScreen(),);
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const ProductsDetailsColorSelector(),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Sizes",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const ProductsDetailsSizeSelector(),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  const Text(
                    '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                    textAlign: TextAlign.justify,
                  ),
                ],
              );
  }
}
