import 'package:ecommerce/ui/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(ImagesUtils.craftyBayNavBarLogoSVG),
        forceMaterialTransparency: true,
        actions: const [
          Card(
            elevation: 5,
            shape: CircleBorder(),
            child: Icon(
              Icons.person_outline,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Card(
            elevation: 5,
            shape: CircleBorder(),
            child: Icon(
              Icons.phone_outlined,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Card(
            elevation: 5,
            shape: CircleBorder(),
            child: Icon(
              Icons.notifications_active,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.grey,
                hintText: "Search",
              ),
            )
          ],
        ),
      ),
    );
  }
}
