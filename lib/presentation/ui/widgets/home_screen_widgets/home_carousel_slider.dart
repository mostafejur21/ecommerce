import 'package:ecommerce/data/models/home_screen_slider_data.dart';
import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  final List<SliderData> sliders;

  const HomeCarouselSlider({super.key, required this.sliders});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  SliderData data = SliderData();
  int currentIndex = 0;
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            padEnds: false,
            controller: PageController(initialPage: 1, viewportFraction: 1),
            onPageChanged: (value) {
              _selectedSlider.value = value;
            },
            itemCount: widget.sliders.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColor.primaryColor.withOpacity(0.3),
                ),
                child: Stack(
                  children: [
                    Image.network(data.image ?? "error", scale: 1.0,fit: BoxFit.scaleDown,),
                    Positioned(
                      bottom: 0,
                      child: Text(
                        data.title ?? "",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
          valueListenable: _selectedSlider,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < widget.sliders.length; i++) {
              list.add(
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          value == i ? AppColor.primaryColor : Colors.black54),
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
          },
        ),
      ],
    );
  }
}
