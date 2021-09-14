import 'dart:io';

import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  TextEditingController name = new TextEditingController();

  TextEditingController email = new TextEditingController();

  TextEditingController mobile = new TextEditingController();

  TextEditingController password = new TextEditingController();

  TextEditingController avatar = new TextEditingController();

  File ProfileImage;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  signup() {
    WebServices()
        .signup(
            email: email.text,
            password: password.text,
            mobile: mobile.text,
            name: name.text)
        .then((value) {
      if (value.data.body['status']) {
        Get.back();
        Fluttertoast.showToast(msg: 'تم الحفظ بنجاح');
      } else {
        Fluttertoast.showToast(msg: value.data.body['data']);
      }
    }, onError: (errr) {
      Fluttertoast.showToast(msg: 'خطاء');
    });
  }

  merchantSignup() {
    WebServices()
        .merchantSignup(
      email: email.text,
      password: password.text,
      mobile: mobile.text,
      name: name.text,
      image: ProfileImage,
    )
        .then((value) {
      if (value.data.body['status']) {
        Get.back();
        Fluttertoast.showToast(msg: 'تم الحفظ بنجاح');
      } else {
        Fluttertoast.showToast(msg: value.data.body['data']);
      }
    }, onError: (errr) {
      Fluttertoast.showToast(msg: 'خطاء');
    });
  }
}
