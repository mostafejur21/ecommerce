import 'package:ecommerce/data/models/cart_list_data.dart';
import 'package:ecommerce/presentation/state_holders/cart_list_controller.dart';
import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:ecommerce/presentation/ui/utils/images_utils.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListTileCard extends StatelessWidget {
final CartData cartData;
const CartListTileCard({
    super.key, required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        isThreeLine: true,
        leading: Image.asset(ImagesUtils.shoePng),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cartData.product?.title ?? "",
              style: const TextStyle(color: Colors.black54),
            ),
            const Icon(CupertinoIcons.delete),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Color: ${cartData.color ?? ''}, Size: ${cartData.size}",
              style: const TextStyle(fontSize: 11),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "\$ ${cartData.product?.price ?? 0}",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CustomStepper(
                    stepValue: 1,
                    lowerLimit: 1,
                    upperLimit: 20,
                    value: cartData.numberOfItems,
                    onChanged: (value) {
                      Get.find<CartListController>().changeItem(cartData.id!, value);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
