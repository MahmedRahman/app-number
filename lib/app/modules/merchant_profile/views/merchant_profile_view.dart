import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/merchant_profile_controller.dart';

class MerchantProfileView extends GetView<MerchantProfileController> {
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
                        '${userData['name']}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            defaultProfileCard(
              title: 'الملف الشخصى',
              leadingIcon: Image.asset(
                'images/profile.png',
                color: KprimaryColor,
              ),
              onTap: () {
                Get.toNamed(Routes.MERCHANT_PROFILE_INFO);
              },
            ),
            defaultProfileCard(
              title: 'المنتجات',
              leadingIcon: Image.asset(
                'images/icion1.png',
                color: KprimaryColor,
              ),
              onTap: () {
                selectScreen.value = 0;
              },
            ),
            defaultProfileCard(
              title: 'طلبات الشراء',
              leadingIcon: Image.asset(
                'images/icion2.png',
                color: KprimaryColor,
              ),
              onTap: () {
                selectScreen.value = 3;
              },
            ),
            defaultProfileCard(
              title: 'تسجيل الخروج',
              leadingIcon: Image.asset(
                'images/exit.png',
                color: KprimaryColor,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  defaultProfileCard({
    @required String title,
    Widget leadingIcon,
    @required Function onTap,
  }) =>
      Card(
        child: ListTile(
          onTap: onTap,
          title: Text(title),
          leading: leadingIcon,
        ),
      );
}
