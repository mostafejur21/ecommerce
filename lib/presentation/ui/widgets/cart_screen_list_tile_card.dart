import 'package:ecommerce/data/models/cart_list_data.dart';
import 'package:ecommerce/presentation/state_holders/cart_list_controller.dart';
import 'package:ecommerce/presentation/state_holders/delete_cart_list.dart';
import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListTileCard extends StatelessWidget {
  final CartData cartData;

  const CartListTileCard({
    super.key,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(cartData.product?.image ?? 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),),),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartData.product?.title ?? '',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 12),
                                children: [
                                  TextSpan(
                                      text: 'Color: ${cartData.color ?? ''} '),
                                  TextSpan(text: 'Size: ${cartData.size}'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      GetBuilder<DeleteCartListController>(
                        builder: (deleteController) {
                          return IconButton(
                              onPressed: () async{
                                bool delete = await deleteController.deleteCartId(cartData.productId!);
                                if(delete){
                                  Get.snackbar("success", "products deleted successfully");
                                }else{
                                  Get.snackbar("failed", "products delete failed");
                                }
                              },
                              icon: const Icon(Icons.delete_outline));
                        }
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${cartData.product?.price ?? '2000'}',
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 85,
                        child: FittedBox(
                          child: CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 20,
                            stepValue: 1,
                            value: cartData.numberOfItems,
                            onChanged: (int value) {
                              Get.find<CartListController>()
                                  .changeItem(cartData.id!, value);
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
