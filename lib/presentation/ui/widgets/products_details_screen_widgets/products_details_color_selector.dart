import 'package:flutter/material.dart';

class ProductsDetailsColorSelector extends StatefulWidget {
  const ProductsDetailsColorSelector({super.key});

  @override
  State<ProductsDetailsColorSelector> createState() => _ProductsDetailsColorSelectorState();
}

class _ProductsDetailsColorSelectorState extends State<ProductsDetailsColorSelector> {

  final List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.black,
  ];
  int colorSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, int index) {
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              colorSelectedIndex = index;
              if (mounted) {
                setState(() {});
              }
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: colors[index],
              child: colorSelectedIndex == index
                  ? const Icon(
                Icons.done,
                color: Colors.white,
              )
                  : null,
            ),
          );
        },

        separatorBuilder: (context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}
