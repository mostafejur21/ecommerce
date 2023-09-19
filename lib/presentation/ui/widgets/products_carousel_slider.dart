import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProductsDetailsCarouselSlider extends StatefulWidget {
  const ProductsDetailsCarouselSlider({super.key});

  @override
  State<ProductsDetailsCarouselSlider> createState() =>
      _ProductsDetailsCarouselSliderState();
}

class _ProductsDetailsCarouselSliderState
    extends State<ProductsDetailsCarouselSlider> {
  final List color = [Colors.grey, Colors.blue, Colors.amber, Colors.green];

  int currentIndex = 0;

  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            padEnds: false,
            controller: PageController(initialPage: 1, viewportFraction: 2),
            onPageChanged: (value) {
              _selectedSlider.value = value;
            },
            itemCount: color.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: color[index],
                ),
                child: Center(
                  child: Text("Images ${index + 1}"),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 18,
          right: 0,
          left: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedSlider,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < color.length; i++) {
                list.add(
                  Container(
                    width: 12,
                    height: 12,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: value == i
                            ? AppColor.primaryColor
                            : Colors.white70),
                  ),
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            },
          ),
        ),
      ],
    );
  }
}
