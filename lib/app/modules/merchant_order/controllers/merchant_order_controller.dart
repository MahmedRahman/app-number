import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MerchantOrderController extends GetxController {
  //TODO: Implement MerchantOrderController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  var OrdersMerchant = Future.value().obs;

   getOrdersMerchant() async {
    ResponsModel responsModel = await WebServices().getOrdersMerchant();
    if (responsModel.success) {
      Response response = responsModel.data;
      OrdersMerchant.value = Future.value(response.body['data']);
      return response.body['data'];
    }
  }

  Future approveOrderMerchant({@required String orderid}) async {
    ResponsModel responsModel =
        await WebServices().approveOrderMerchant(order: orderid);
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['status']) {
        Fluttertoast.showToast(msg: 'تم قبول الطلبية ');
        getOrdersMerchant();
      } else {
        Fluttertoast.showToast(msg: 'خطاء ');
      }
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
