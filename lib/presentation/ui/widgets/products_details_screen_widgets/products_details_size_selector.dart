import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProductsDetailsSizeSelector extends StatefulWidget {
  final List<String> sizes;
  final Function(int index) onSelect;
  final int initialSelected;
  const ProductsDetailsSizeSelector({super.key, required this.sizes, required this.onSelect, required this.initialSelected});

  @override
  State<ProductsDetailsSizeSelector> createState() =>
      _ProductsDetailsSizeSelectorState();
}

class _ProductsDetailsSizeSelectorState
    extends State<ProductsDetailsSizeSelector> {
  int sizesSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.sizes.length,
        itemBuilder: (context, int index) {
          return InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () {
              sizesSelectedIndex = index;
              widget.onSelect(index);
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
                    sizesSelectedIndex == index ? AppColor.primaryColor : null,
              ),
              alignment: Alignment.center,
              child: Text(widget.sizes[index]),
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
