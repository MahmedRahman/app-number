import 'dart:ui';

import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  var usertype = 0.obs;
  var data;
  @override
  Widget build(BuildContext context) {
    data = Get.arguments;
    usertype.value = GetUtils.isNullOrBlank(data) ? 0 : data[0];

    if (usertype.value == 0) {
      controller.email.text = 'test1000@example.com';
      controller.password.text = '12345678';
    } else {
      controller.email.text = 'my_shop@example.com';
      controller.password.text = '12345678';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل دخول'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: Column(
              children: [
                Image.asset(
                  'images/number.png',
                  color: KprimaryColor,
                  width: 128,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'البريد الالكترونى',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'كلمة السر',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                defaultButton(
                  title: 'تسجيل دخول',
                  onPressed: () {
                    if (usertype.value == 0) {
                      controller.signin();
                    } else {
                      controller.signinMerchant();
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                defaultButton(
                  title: 'تسجيل حساب جديد',
                  onPressed: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
