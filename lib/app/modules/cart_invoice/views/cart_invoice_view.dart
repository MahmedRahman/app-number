import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_invoice_controller.dart';

class CartInvoiceView extends GetView<CartInvoiceController> {
  CartInvoiceView() {
    int totalQty = 0;
    double totalPrice = 0;
    cartProducts.forEach((element) {
      totalQty = totalQty + element.qty;
      totalPrice = totalPrice + element.productsPrice;
      KcartToalProduct.value = totalPrice.toString();
      KcartQty.value = totalQty.toString();
    });

    KcartToal.value =
        ((totalPrice + KTax.value + Kshipping.value) - Kdiscount.value).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفاتورة'),
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
          title: 'اتمام عملية الشراء',
          onPressed: () {
            controller.createOrders();
          }),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('السعر'),
                trailing: Text('${KcartToalProduct.value}  ريال'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('العدد'),
                trailing: Text('${KcartQty.value}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('الضريبة'),
                trailing: Text('${KTax.value} ريال'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('الشحن'),
                trailing: Text('${Kshipping.value} ريال'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('الخصم'),
                trailing: Text('${Kdiscount.value} ريال'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('الاجمالى'),
                trailing: Text('${KcartToal.value} ريال'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
