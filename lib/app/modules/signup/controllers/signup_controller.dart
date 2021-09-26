import 'dart:io';

import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:app_number/auth.dart';
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

  TextEditingController city = new TextEditingController();

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
      city: city.text,
      name: name.text,
    )
        .then((response) {
      if (response.data.body['status']) {
        Fluttertoast.showToast(msg: 'تم الحفظ بنجاح');

        Get.find<UserAuth>().setUserToken(
          response.data.body['data']['token'].toString(),
        );

        isLogin.value = true;
        selectScreen.value = 2;
        Get.offAndToNamed(Routes.LAYOUT);
      } else {
        Fluttertoast.showToast(msg: response.data.body['message']);
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
      city: city.text,
      image: ProfileImage,
    )
        .then((response) {
      print(response.data.bodyString);

      if (response.data.body['status']) {
        Get.find<UserAuth>().setUserToken(
          response.data.body['data']['token'].toString(),
        );

        WebServices().getCategories().then((CategoriesResponse) {
          if (CategoriesResponse.data.body['status']) {
            categoriesItems = CategoriesResponse.data.body['data'];
          }

          WebServices().getProfileMerchant().then((MerchantResponse) {
            if (MerchantResponse.data.body['status']) {
              userData = MerchantResponse.data.body['data'];
              isLogin.value = true;
              selectScreen.value = 2;
              Get.offAndToNamed(Routes.DASHBORD);
            }
          });
        });

        //Get.toNamed(Routes.SIGNIN, arguments: [1, email.text, password.text]);

        //Get.back();
        Fluttertoast.showToast(msg: 'تم الحفظ بنجاح');
      } else {
        Fluttertoast.showToast(msg: response.data.body['message']);
      }
    }, onError: (errr) {
      Fluttertoast.showToast(msg: 'خطاء');
    });
  }
}
