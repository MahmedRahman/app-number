import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MerchantProductController extends GetxController {
  //TODO: Implement MerchantProductController

  final count = 0.obs;

  var FutureProductsList = Future.value().obs;

  Future getProductsMerchant() async {
    ResponsModel responsModel = await WebServices().getProductsMerchant();
    if (responsModel.success) {
      print(responsModel.data.body['data']);
      FutureProductsList.value = Future.value(responsModel.data.body['data']);
      return responsModel.data.body['data'];
    }
  }

  Future deleteProductsMerchant({@required productId}) async {
    ResponsModel responsModel =
        await WebServices().deleteProductsMerchant(productid: productId);

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

      getProductsMerchant();
    }
  }
}
