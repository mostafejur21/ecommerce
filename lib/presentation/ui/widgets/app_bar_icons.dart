import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const AppBarIcons({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        child: Icon(
          icon,
          color: Colors.black54,
        ),
      ),
    );
  }
}
