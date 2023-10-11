import 'package:ecommerce/presentation/state_holders/products_wish_list_controller.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce/presentation/ui/widgets/products_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductsWishListController>().getWishList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Wish List", false),
      body: GetBuilder<ProductsWishListController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            itemCount: controller.productModel.data?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, int index) {
              return FittedBox(
                child: ProductsCard(
                  product: controller.productModel.data![index],
                  isShowDeleteButton: true,
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
