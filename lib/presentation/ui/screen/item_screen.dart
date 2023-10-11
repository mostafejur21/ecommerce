import 'package:ecommerce/data/models/products_model.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce/presentation/ui/widgets/products_card.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  final String title;
  final ProductModel products;

  const ItemsScreen(
      {Key? key,
      required this.title,
      required this.products})
      : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(widget.title, true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          itemCount: widget.products.data?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, int index) {
            return FittedBox(
              child: ProductsCard(
                product: widget.products.data![index], isShowDeleteButton: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
