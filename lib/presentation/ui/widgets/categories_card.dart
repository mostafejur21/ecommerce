import 'package:ecommerce/data/models/category_data.dart';
import 'package:ecommerce/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerce/presentation/ui/screen/category_products_list_screen.dart';
import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesCard extends StatelessWidget {
  final CategoryData categoryData;

  const CategoriesCard({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GetBuilder<CategoryProductListController>(builder: (controller) {
        return Column(
          children: [
            InkWell(
              child: Container(
                  height: 60,
                  width: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(
                    categoryData.categoryImg ?? "",
                    height: 50,
                  )),
              onTap: () {
                Get.to(() => CategoryProductsListScreen(
                      title: categoryData.categoryName ?? "",
                      categoryId: categoryData.id ?? 0,
                    ));
              },
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              categoryData.categoryName ?? "",
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  color: AppColor.primaryColor,
                  letterSpacing: 0.4),
            ),
          ],
        );
      }),
    );
  }
}
