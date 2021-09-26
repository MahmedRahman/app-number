import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../controllers/coupon_controller.dart';

class CouponView extends GetView<CouponController> {
  var data;
  @override
  Widget build(BuildContext context) {
    data = Get.arguments;

    return Scaffold(
      backgroundColor: KprimaryColor.withOpacity(.5),
      appBar: AppBar(
        title: Text('كوبونات'),
        centerTitle: true,
      ),
      body: data.length == 0
          ? Center(
              child: Container(
                child: Text(
                  'لا يوجد كوبونات',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : PageView(
              children: List.generate(
                data.length,
                (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    couponItem(
                      discount: data[index]['discount'].toString(),
                      name: data[index]['name'].toString(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget couponItem({
    @required String discount,
    @required String name,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'تهانينا',
                    style: TextStyle(
                      fontSize: 28,
                      color: KprimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'هذا هو الكود للحصول على كوبون   ',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'خصم ${discount}%',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: KprimaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${name}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: KprimaryColor,
                    onPressed: () {
                      Clipboard.setData(new ClipboardData(text: discount));
                      Fluttertoast.showToast(msg: 'تم نسخ الكود');
                    },
                    child: Text(
                      'احصل عليه',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
