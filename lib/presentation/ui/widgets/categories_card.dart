import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.monitor_outlined,
              size: 32,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            "Electronics",
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 15,
                color: AppColor.primaryColor,
                letterSpacing: 0.4),
          ),
        ],
      ),
    );
  }
}
