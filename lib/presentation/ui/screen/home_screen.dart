import 'package:ecommerce/presentation/ui/utils/images_utils.dart';
import 'package:ecommerce/presentation/ui/widgets/app_bar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImagesUtils.craftyBayNavBarLogoSVG),
            const Spacer(),
            AppBarIcons(
              icon: Icons.person_outline,
              onTap: () {},
            ),
            const SizedBox(
              width: 12,
            ),
            AppBarIcons(
              icon: Icons.phone_outlined,
              onTap: () {},
            ),
            const SizedBox(
              width: 12,
            ),
            AppBarIcons(
              icon: Icons.notifications_active_outlined,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
