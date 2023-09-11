import 'package:flutter/material.dart';

class TitleHeaderAndSeeAllButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleHeaderAndSeeAllButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: onTap,
          child: const Text("See All"),
        ),
      ],
    );
  }
}
