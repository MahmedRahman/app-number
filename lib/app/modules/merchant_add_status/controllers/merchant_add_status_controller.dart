import 'dart:convert';
import 'dart:io';

import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';

class MerchantAddStatusController extends GetxController {
  TextEditingController statusText = new TextEditingController();
  File statusImage;
  var FutureStatusList = Future.value().obs;

  Future<File> file;

  ResponsModel responsModel;

  @override
  void onInit() {
    super.onInit();
  }

  Future getStatusMerchant() async {
    //if (GetUtils.isNull(responsModel)) {
    responsModel = await WebServices().getStatusMerchant();

    if (responsModel.success) {
      Response response = responsModel.data;
      // statusList.value.assignAll(response.body['data']);
      FutureStatusList.value = Future.value(response.body['data']);
      return response.body['data'];
    }
  }





  Future addStatusMerchant() async {
    ResponsModel responsModel = await WebServices().addStatusMerchant(
      text: statusText.text,
      statusImage: statusImage,
      statusvideo: '',
    );

    statusText.clear();

    if (responsModel.success) {
      Response response = responsModel.data;

      print(response.bodyString);
      if (response.body['status']) {
        Fluttertoast.showToast(
          msg: response.body['message'],
          toastLength: Toast.LENGTH_SHORT,
        );
        //Get.back();
      } else {
        Fluttertoast.showToast(
          msg: response.body['message'],
          toastLength: Toast.LENGTH_SHORT,
        );
      }

      getStatusMerchant();
    }
  }

  deleteStatusMerchant({@required statusId}) async {
    ResponsModel responsModel =
        await WebServices().deleteStatusMerchant(statusId: statusId);

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
      getStatusMerchant();
    }
  }
}
