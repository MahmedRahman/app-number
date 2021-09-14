import 'dart:io';

import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/merchant_contest/controllers/merchant_contest_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MerchantAddContestController extends GetxController {
  //TODO: Implement MerchantAddContestController

  TextEditingController Quize = new TextEditingController();
  TextEditingController prize = new TextEditingController();
  File imageFile;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  addQuizMerchant() async {
    ResponsModel responsModel = await WebServices().addQuizMerchant(
      text: Quize.text,
      image: imageFile,
      prize: prize.text,
    );

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['status']) {
        Fluttertoast.showToast(
          msg: response.body['message'],
          toastLength: Toast.LENGTH_SHORT,
        );
        MerchantContestController controller =
            Get.put(MerchantContestController());
        controller.getQuizMerchant();
        Get.back();
      } else {
        Fluttertoast.showToast(
          msg: response.body['message'],
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
