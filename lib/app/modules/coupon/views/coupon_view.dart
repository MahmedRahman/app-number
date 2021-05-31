import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coupon_controller.dart';

class CouponView extends GetView<CouponController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor.withOpacity(.5),
      appBar: AppBar(
        title: Text('كوبونات'),
        centerTitle: true,
      ),
      body: PageView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [couponItem()],
          ),
             Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [couponItem()],
          ),
             Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [couponItem()],
          ),
        ],
      ),
    );
  }

  Widget couponItem() => Padding(
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
                    'خصم 20%',
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
                    'Zp25ifl3d',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: KprimaryColor,
                    onPressed: () {},
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
