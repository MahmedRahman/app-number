import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/discount_controller.dart';

class DiscountView extends GetView<DiscountController> {
  var data;
  @override
  Widget build(BuildContext context) {
    data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('خصومات'),
        centerTitle: true,
      ),
      body: data.length == 0
          ? Center(
              child: Container(
                child: Text(
                  'لا يوجد خصومات',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: KprimaryColor,
                            width: 1.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            FontAwesomeIcons.shoppingBag,
                            color: KprimaryColor,
                          ),
                          radius: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          data[0]['merchant']['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: List.generate(
                      data.length,
                      (index) => itemProduct(
                            image: data[index]['cover'],
                            price: data[index]['price'].toString(),
                            title: data[index]['name'],
                            traderName: '',
                            discout: data[index]['discount'].toString(),
                            productId: data[index]['id'],
                          )),
                ),
              ],
            ),
    );
  }


}
