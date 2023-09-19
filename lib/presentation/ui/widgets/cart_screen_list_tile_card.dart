import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:ecommerce/presentation/ui/utils/images_utils.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartListTileCard extends StatelessWidget {
  const CartListTileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        isThreeLine: true,
        leading: Image.asset(ImagesUtils.shoePng),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Year Spacial Shoe",
              style: TextStyle(color: Colors.black54),
            ),
            Icon(CupertinoIcons.delete),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Color: Red, Size: X",
              style: TextStyle(fontSize: 11),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "\$200",
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CustomStepper(
                    stepValue: 1,
                    lowerLimit: 1,
                    upperLimit: 20,
                    value: 1,
                    onChanged: (value) {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
