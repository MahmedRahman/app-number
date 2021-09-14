import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_book_detail_controller.dart';

class OrderBookDetailView extends GetView<OrderBookDetailController> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الطلب'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            defaultList(
              title: 'الاجمالى' ,
              subtitle: data[0]['cart_total'].toString()
            ),
            defaultList(
              title: 'المبلغ الفرعى' ,
              subtitle: data[0]['subtotal'].toString()
            ),
             defaultList(
              title: 'الضريبة' ,
              subtitle: data[0]['tax'].toString()
            ),
             defaultList(
              title: 'الشحن' ,
              subtitle: data[0]['shipping'].toString()
            ),
            defaultList(
              title: 'العنوان' ,
              subtitle: '${data[0]['address']['name'].toString()} ${data[0]['address']['area'].toString()}'
            ),
            Column(
              children: List.generate(data[0]['items'].length, (index) => defaultList(
              title: 'اسم المنتج' ,
              subtitle: '${data[0]['items'][index]['name'].toString()} - ${data[0]['items'][index]['price'].toString()} ريال'
            ),),
            )
          ],
        ),
      ),
    );
  }

  defaultList({@required title, @required subtitle}) => Card(
    child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
  );
}
