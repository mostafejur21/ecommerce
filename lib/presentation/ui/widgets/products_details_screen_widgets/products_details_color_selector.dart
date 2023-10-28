import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProductsDetailsColorSelector extends StatefulWidget {
  final List<String> colors;
  final int selectedColor;
  final Function(int index) onSelected;

  const ProductsDetailsColorSelector({Key? key, required this.colors, required this.selectedColor, required this.onSelected}) : super(key: key);

  @override
  State<ProductsDetailsColorSelector> createState() => _ProductsDetailsColorSelectorState();
}

class _ProductsDetailsColorSelectorState extends State<ProductsDetailsColorSelector> {
  int colorSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        itemBuilder: (context, int index) {
          return InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () {
              colorSelectedIndex = index;
              widget.onSelected(index);
              if (mounted) {
                setState(() {});
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
                color:
                colorSelectedIndex == index ? AppColor.primaryColor : null,
              ),
              alignment: Alignment.center,
              child: Text(widget.colors[index]),
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
