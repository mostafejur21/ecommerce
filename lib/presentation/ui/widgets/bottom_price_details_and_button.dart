import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class BottomPriceDetailsAndButton extends StatelessWidget {
  const BottomPriceDetailsAndButton({
    super.key, required this.priceText, required this.actualPrice, required this.buttonText, required this.whatWillHappenWhenPressTheButton,
  });

  final String priceText;
  final String actualPrice;
  final String buttonText;
  final VoidCallback whatWillHappenWhenPressTheButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        color: AppColor.primaryColor.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  priceText,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  actualPrice,
                  style: const TextStyle(
                      fontSize: 18,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: whatWillHappenWhenPressTheButton,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
