import 'package:ecommerce/presentation/ui/utils/color_extention.dart';
import 'package:flutter/material.dart';

class ProductsDetailsColorSelector extends StatefulWidget {
  final List<String> colorCodes;

  const ProductsDetailsColorSelector({Key? key, required this.colorCodes}) : super(key: key);

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
        itemCount: widget.colorCodes.length,
        itemBuilder: (context, int index) {
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              setState(() {
                colorSelectedIndex = index;
              });
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: HexColor.fromHex(widget.colorCodes[index]),
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
