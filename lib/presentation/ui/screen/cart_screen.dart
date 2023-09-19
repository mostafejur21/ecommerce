import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:ecommerce/presentation/ui/widgets/cart_screen_list_tile_card.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Cart", false),
      body: Column(
        children: [
          listViewForCartItems,
          bottomTotalPriceAndCheckOutButtonContainer,
        ],
      ),
    );
  }

  Container get bottomTotalPriceAndCheckOutButtonContainer {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        color: AppColor.primaryColor.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Total Price",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\$10,000.00",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Check Out",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded get listViewForCartItems {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CartListTileCard(),
          );
        },
      ),
    );
  }
}
