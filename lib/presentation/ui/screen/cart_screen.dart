import 'package:ecommerce/presentation/ui/utils/app_color.dart';
import 'package:ecommerce/presentation/ui/utils/images_utils.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(true, "Cart"),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: ListTile(
                        isThreeLine: true,
                        leading: Image.asset(ImagesUtils.shoePng),
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Year Spacial Shoe",
                              style: TextStyle(color: Colors.black54),
                            ),
                            Icon(CupertinoIcons.delete),

                            // ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Color: Red, Size: X",
                              style: TextStyle(fontSize: 11),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "\$200",
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  color: AppColor.primaryColor.withOpacity(0.9),
                                  child: const Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                const Text("1"),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  color: AppColor.primaryColor.withOpacity(0.9),
                                  child: const Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
                color: AppColor.primaryColor.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Total Price", style: TextStyle(fontSize: 12),),
                        SizedBox(height: 5,),
                        Text("\$10,000.00", style: TextStyle(fontSize: 18, color: AppColor.primaryColor, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(onPressed: (){},child: const Text("Check Out", style: TextStyle(fontSize: 12),),),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
