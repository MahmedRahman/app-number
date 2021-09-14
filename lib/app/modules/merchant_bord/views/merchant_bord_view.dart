import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/merchant_add_status/views/summary.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/merchant_bord_controller.dart';

class MerchantBordView extends GetView<MerchantBordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/number.png',
              color: KprimaryColor,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: defaultTitle(
                  onTap: () {
                    selectScreen.value = 1;
                  },
                  title: 'منتجات',
                  icon: 'images/add_product.png',
                )),
                Expanded(
                    child: defaultTitle(
                  onTap: () {
                    Get.toNamed(Routes.MERCHANT_ADD_STATUS);
                  },
                  title: 'حالات',
                  icon: 'images/add_status.png',
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: defaultTitle(
                  onTap: () {
                    Get.toNamed(Routes.MERCHANT_CONTEST);
                  },
                  title: 'مسابقات',
                  icon: 'images/add_contest.png',
                )),
                Expanded(
                    child: defaultTitle(
                  onTap: () {
                    Get.toNamed(Routes.MERCHANT_ADD_COUPON);
                  },
                  title: 'اكواد الخصم',
                  icon: 'images/icion5.png',
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: defaultTitle(
                  onTap: () {
                    Get.to(summary_view(),fullscreenDialog: true);
                  },
                  title: 'موجز',
                  icon: 'images/add_contest.png',
                )),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  defaultTitle({
    Function onTap,
    String title,
    String icon,
  }) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: KprimaryColor),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50.0),
                topLeft: Radius.circular(50.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    icon,
                    width: 64,
                    height: 64,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffAE1D6D),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
