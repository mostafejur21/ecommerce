import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:ecommerce/presentation/ui/utils/images_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartListTileCard extends StatelessWidget {
  const CartListTileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  color: AppColor.primaryColor.withOpacity(0.9),
                  child: const Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const Text("1"),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  color: AppColor.primaryColor.withOpacity(0.9),
                  child: const Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
