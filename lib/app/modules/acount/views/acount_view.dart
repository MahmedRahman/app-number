import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/favourite/views/favourite_view.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:app_number/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/acount_controller.dart';

class AcountView extends GetView<AcountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: KprimaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'M',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'محمد عبد الرحمن',
                    style: TextStyle(
                      color: KprimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  selectScreen.value = 0;
                },
                title: Text('الاقسام'),
                leading: Icon(
                  FontAwesomeIcons.building,
                  color: KprimaryColor,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  selectScreen.value = 1;
                },
                title: Text('المفضلة'),
                leading: Icon(
                  FontAwesomeIcons.solidHeart,
                  color: KprimaryColor,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  selectScreen.value = 3;
                },
                title: Text('ٍسلة المشتريات'),
                leading: Icon(
                  FontAwesomeIcons.shoppingCart,
                  color: KprimaryColor,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Get.toNamed(Routes.ORDER_BOOK);
                },
                title: Text('طلباتى'),
                leading: Icon(
                  FontAwesomeIcons.shoppingBag,
                  color: KprimaryColor,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Get.toNamed(Routes.ADDRESS_BOOK);
                },
                title: Text('العناوين'),
                leading: Icon(
                  FontAwesomeIcons.addressBook,
                  color: KprimaryColor,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
                },
                title: Text('الملف الشخصى'),
                leading: Icon(
                  Icons.settings,
                  color: KprimaryColor,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Get.find<UserAuth>().setUserToken(null);
                  isLogin.value = false;
                  selectScreen.value = 2;
                },
                title: Text('تسجيل الخروج'),
                leading: Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: KprimaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
