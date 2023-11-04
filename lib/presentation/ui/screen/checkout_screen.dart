import 'package:ecommerce/data/models/payment_method.dart';
import 'package:ecommerce/presentation/state_holders/create_invoice_controller.dart';
import 'package:ecommerce/presentation/ui/screen/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool isInvoiceCreated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().createInvoice().then((value) {
        isInvoiceCreated = value;
        if (mounted) {
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
      ),
      body: GetBuilder<CreateInvoiceController>(
        builder: (controller) {
          if (controller.isInvoiceCreated) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!isInvoiceCreated) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }
          return ListView.separated(
            itemCount:
                controller.createResponseModel?.paymentMethod?.length ?? 0,
            itemBuilder: (context, int index) {
              final PaymentMethod paymentMethod =
                  controller.createResponseModel!.paymentMethod![index];
              return ListTile(
                leading: Image.network(
                  paymentMethod.logo ?? "",
                  width: 60,
                ),
                title: Text(paymentMethod.name ?? ""),
                onTap: () {
                  Get.off(() => WebViewScreen(
                      paymentUrl: paymentMethod.redirectGatewayURL!));
                },
              );
            },
            separatorBuilder: (_, __) {
              return const Divider();
            },
          );
          // else {
          //   return const Center(
          //     child: Text('Something went wrong!'),
          //   );
          // }
        },
      ),
    );
  }
}
