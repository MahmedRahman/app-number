import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_book_controller.dart';

class OrderBookView extends GetView<OrderBookController> {
  OrderBookController controller = Get.put(OrderBookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الطلبيات'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getOrdersBook(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        snapshot.data.length,
                        (index) => Card(
                              child: ListTile(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.ORDER_BOOK_DETAIL,
                                    arguments: [snapshot.data[index]],
                                  );
                                },
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'رقم الطلبية  ${snapshot.data[index]['id'].toString()}'),
                                    Text(
                                        'تاريخ الطلبية  ${snapshot.data[index]['date'].toString()}'),
                                    Text(
                                        ' الاجمالى ${snapshot.data[index]['cart_total'].toString()} '),
                                  ],
                                ),
                                subtitle: Text(
                                    'الحالة ${snapshot.data[index]['status'].toString()} '),
                              ),
                            )),
                  ),
                ),
              );
            }

            return Center(
              child: Text(
                'برجاء تسجيل الدخول',
                style: TextStyle(fontSize: 20),
              ),
            );
          }),
    );
  }
}
