import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/merchant_home_controller.dart';

class MerchantHomeView extends GetView<MerchantHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: KprimaryColor),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0),
                ),
              ),
              width: Get.width,
              height: 150,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      child: CustomImageCached(imageUrl: userData['image']),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      userData['name'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KprimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      userData['email'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: KprimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: defaultbox(
                  image: 'images/icon2.png',
                  title: 'الرئسية',
                  onTap: () {
                    selectScreen.value = 2;
                  },
                )),
                Expanded(
                    child: defaultbox(
                  image: 'images/icon4.png',
                  title: 'المنتجات',
                  onTap: () {
                    selectScreen.value = 1;
                  },
                ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: defaultbox(
                    image: 'images/icon1.png',
                    title: ' الطلبات',
                    onTap: () {
                      selectScreen.value = 3;
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  defaultbox({
    @required String title,
    @required String image,
    Function onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
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
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: Image.asset(image),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
