import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductViewList extends StatelessWidget {
  var data;
  @override
  Widget build(BuildContext context) {
    data = Get.arguments[0];

    print(data);

    return Scaffold(
        appBar: AppBar(
          title: Text('منتجات'),
        ),
        body: data.length == 0 ? Container(
          child: Text('لا يوجد منتجات'),
        ) : SingleChildScrollView(
          child: Column(
            children: List.generate(
              data.length,
              (index) => itemProduct(
                image: data[index]['cover'],
                price: data[index]['price'].toString(),
                title: data[index]['name'],
                traderName: '',
                discout: data[index]['discount'].toString(),
                productId: data[index]['id'],
              ),
            ),
          ),
        ));
  }
}
