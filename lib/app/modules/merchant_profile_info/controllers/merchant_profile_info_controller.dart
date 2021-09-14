import 'dart:io';

import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MerchantProfileInfoController extends GetxController {
  //TODO: Implement MerchantProfileInfoController

  TextEditingController name = new TextEditingController();

  TextEditingController email = new TextEditingController();

  TextEditingController phone = new TextEditingController();

  TextEditingController oldPassword = new TextEditingController();

  TextEditingController newPassword = new TextEditingController();

  String image;
  File profileImage;

  final count = 0.obs;
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

  Future getProfileMerchant() async {
    ResponsModel responsModel = await WebServices().getProfileMerchant();
    if (responsModel.success) {
      Response response = responsModel.data;
      name.text = response.body['data']['name'];
      email.text = response.body['data']['email'];
      phone.text = response.body['data']['phone'];
      image = response.body['data']['image'];
      return response.body['data'];
    }
  }

  editProfileMerchant() async {
    ResponsModel responsModel = await WebServices().editProfileMerchant(
        name: name.text, phone: phone.text, profileImage: profileImage);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['status']) {
        Fluttertoast.showToast(
          msg: response.body['message'],
          toastLength: Toast.LENGTH_SHORT,
        );
        
      } else {
        Fluttertoast.showToast(
          msg: response.body['message'],
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }
  }

  profileChangePassword() async {
    ResponsModel responsModel = await WebServices()
        .profileChangePasswordMerchant(
            oldPassword: oldPassword.text, newPassword: newPassword.text);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['status']) {
        Fluttertoast.showToast(
          msg: response.body['message'],
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        Fluttertoast.showToast(
          msg: response.body['message'],
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }
  }

  void increment() => count.value++;
}
