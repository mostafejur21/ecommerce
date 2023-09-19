import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Adidas Shoe HK23454 - Black Edition",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.7,
            ),
          ),
        ),
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
              size: 17,
            ),
          ),
        ),
        const Text("01"),
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
              size: 17,
            ),
          ),
        ),
      ],
    );
  }
}
