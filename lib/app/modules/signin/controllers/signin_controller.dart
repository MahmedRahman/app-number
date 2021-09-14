import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:app_number/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  void onInit() {
    email.text = 'test1000@example.com';
    password.text = '12345678';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future signin() {
    WebServices().signin(email: email.text, password: password.text).then(
      (value) {
        Response response = value.data;
        if (response.body['status']) {
          Get.find<UserAuth>().setUserToken(
            response.body['data']['token'].toString(),
          );

          // userName.value = response.body['data']['token'].toString();

          isLogin.value = true;
          selectScreen.value = 2;
          Get.offAndToNamed(Routes.LAYOUT);
        } else {
          Fluttertoast.showToast(
            msg: response.body['data'],
            toastLength: Toast.LENGTH_SHORT,
          );
        }

        return true;
      },
    );
  }

  Future signinMerchant() {
    WebServices()
        .signinMerchant(email: email.text, password: password.text)
        .then(
      (value) {
        Response response = value.data;

        if (response.body['status']) {
          Get.find<UserAuth>().setUserToken(
            response.body['data']['token'].toString(),
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
        } else {
          Fluttertoast.showToast(
            msg: response.body['data'],
            toastLength: Toast.LENGTH_SHORT,
          );
        }

        return true;
      },
    );
  }
}
