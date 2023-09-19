import 'package:ecommerce/presentation/ui/screen/create_review_screen.dart';
import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Reviews", true),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, int index) {
                  return reviewCard;
                },
              ),
            ),
          ),
          bottomReviewAndFAB,
        ],
      ),
    );
  }

  Container get bottomReviewAndFAB {
    return Container(
          clipBehavior: Clip.hardEdge,
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
            color: AppColor.primaryColor.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Reviews (1000)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),),
                FloatingActionButton(
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.to(const CreateReviewScreen());
                  },
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),
        );
  }

  Card get reviewCard {
    return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey.shade100,
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Expanded(
                      child: Text(
                        "Mostafejur Rahman",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    overflow: TextOverflow.clip,
                  ),
                )
              ],
            ),
          ),
        );
  }
}
