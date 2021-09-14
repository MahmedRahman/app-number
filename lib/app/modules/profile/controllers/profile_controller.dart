import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController oldPassword = new TextEditingController();
  TextEditingController newPassword = new TextEditingController();

  String image;

  Future getProfile() async {
    ResponsModel responsModel = await WebServices().getProfile();
    if (responsModel.success) {
      Response response = responsModel.data;
      name.text = response.body['data']['name'];
      email.text = response.body['data']['email'];
      phone.text = response.body['data']['mobile'];
      image = response.body['data']['avatar'];
      return response.body['data'];
    }
  }

    editProfile() async {
    ResponsModel responsModel = await WebServices().editProfile(
      name: name.text,
      phone: phone.text,
    );

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
    ResponsModel responsModel = await WebServices().profileChangePassword(
        oldPassword: oldPassword.text, newPassword: newPassword.text);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['status']) {
        Fluttertoast.showToast(
          msg: response.body['message'],
          toastLength: Toast.LENGTH_SHORT,
        );
        Get.back();
      } else {
        Fluttertoast.showToast(
          msg: response.body['message'],
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }
  }
  
}
