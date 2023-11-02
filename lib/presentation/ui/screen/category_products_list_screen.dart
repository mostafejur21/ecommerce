import 'package:ecommerce/data/models/products.dart';
import 'package:ecommerce/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce/presentation/ui/widgets/products_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductsListScreen extends StatefulWidget {
  final String title;
  final int categoryId;

  const CategoryProductsListScreen(
      {Key? key, required this.title, required this.categoryId})
      : super(key: key);

  @override
  State<CategoryProductsListScreen> createState() =>
      _CategoryProductsListScreenState();
}

class _CategoryProductsListScreenState
    extends State<CategoryProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(widget.title, true),
      body: GetBuilder<CategoryProductListController>(builder: (controller) {
        List<Product> productData = controller.productModel.data ?? [];
        if (controller.getCategoryProductsListInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return productData.isEmpty
            ? const Center(
                child: Text('No data found!'),
              )
            : Padding(
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
                        isShowDeleteButton: false,
                      ),
                    );
                  },
                ),
              );
      }),
    );
  }
}
