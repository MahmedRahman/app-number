import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_payment_controller.dart';

class CartPaymentView extends GetView<CartPaymentController> {
  var paymentMethod = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طرق الدفع'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Get.offAllNamed(Routes.LAYOUT);
              })
        ],
      ),
      bottomSheet: defaultButton(
          title: 'متابعة',
          onPressed: () {
            Get.toNamed(Routes.CART_INVOICE);
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Obx(() {
          return Column(
            children: [
              Card(
                child: ListTile(
                  title: Text('كود الخصم'),
                  subtitle: TextFormField(),
                  trailing:
                      IconButton(icon: Icon(Icons.one_k), onPressed: () {}),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  selected: paymentMethod.value == 0 ? true : false,
                  selectedTileColor: Colors.grey[400],
                  title: Text('دفع عندالاستلام'),
                  onTap: () {
                    paymentMethod.value = 0;
                  },
                ),
              ),
              /*Card(
                child: ListTile(
                  selected: paymentMethod.value == 1 ? true : false,
                  selectedTileColor: Colors.grey[400],
                  title: Text('دفع مستر كارد'),
                  onTap: () {
                    paymentMethod.value = 1;
                  },
                ),
              ),*/
            ],
          );
        }),
      ),
    );
  }
}
