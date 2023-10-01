import 'package:ecommerce/presentation/state_holders/popular_products_controller.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce/presentation/ui/widgets/products_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularItemScreen extends StatefulWidget {
  const PopularItemScreen({super.key});

  @override
  State<PopularItemScreen> createState() => _PopularItemScreenState();
}

class _PopularItemScreenState extends State<PopularItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Popular", true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GetBuilder<PopularProductsController>(
          builder: (controller) {
            return GridView.builder(
              itemCount: controller.productModel.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
              crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, int index) {
                return FittedBox(
                  child: ProductsCard(product: controller.productModel.data![index],),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
