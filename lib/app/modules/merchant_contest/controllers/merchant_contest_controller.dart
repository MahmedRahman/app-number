import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MerchantContestController extends GetxController {
  //TODO: Implement MerchantContestController

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
  void increment() => count.value++;


  var FutureQuizList = Future.value().obs;

  Future getQuizMerchant() async {
    //if (GetUtils.isNull(responsModel)) {
   ResponsModel responsModel = await WebServices().getQuizMerchant();

    if (responsModel.success) {
      Response response = responsModel.data;
      // statusList.value.assignAll(response.body['data']);
      FutureQuizList.value = Future.value(response.body['data']);
      return response.body['data'];
    }
  }


    deleteQuizMerchant({@required quizId}) async {
    ResponsModel responsModel =
        await WebServices().deleteQuizMerchant(quizId: quizId);

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
      getQuizMerchant();
    }
  }


}
