import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProductsDetailsCarouselSlider extends StatefulWidget {
  final List<String> imageList;

  const ProductsDetailsCarouselSlider({super.key, required this.imageList});

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
        CarouselSlider(
          options: CarouselOptions(
              height: 240,
              viewportFraction: 1,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.imageList.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(sliderData),
                    ),
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 18,
          right: 0,
          left: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedSlider,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < widget.imageList.length; i++) {
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
