import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Create Review", true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "First Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Last Name",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Write Reviews",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text("Submit")),
            )
          ],
        ),
      ),
    );
  }
}
