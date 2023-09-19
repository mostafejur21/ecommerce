import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce/presentation/ui/widgets/products_card.dart';
import 'package:flutter/material.dart';

class SpacialItemScreen extends StatefulWidget {
  const SpacialItemScreen({super.key});

  @override
  State<SpacialItemScreen> createState() => _SpacialItemScreenState();
}

class _SpacialItemScreenState extends State<SpacialItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Spacial", true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          itemCount: 30,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, int index) {
            return const FittedBox(
              child: ProductsCard(),
            );
          },
        ),
      ),
    );
  }
}
