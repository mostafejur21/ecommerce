import 'package:flutter/material.dart';

class HomeScreenSearchBar extends StatelessWidget {
  const HomeScreenSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide.none),
        prefixIcon: const Icon(Icons.search),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: "Search",
      ),
    );
  }
}