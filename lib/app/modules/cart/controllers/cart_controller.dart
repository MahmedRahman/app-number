import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

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

  var FutureList = Future.value().obs;
  Future getCart() async {
    ResponsModel CartReponse = await WebServices().getCart();
    if (CartReponse.success) {
      Response response = CartReponse.data;
      if (response.body['status']) {
        FutureList.value = Future.value(response.body['data']);
        return response.body['data'];
      }
    }
    return Future.error('خطاء');
  }
  

  Future deleteCart({@required String item_id}) async {
    await WebServices().deleteCart(item_id: item_id.toString()).then((value) {
      Response response = value.data;
      if (response.body['status']) {
        Fluttertoast.showToast(msg: 'تم الحذف');
        getCart();
      } else {
        Fluttertoast.showToast(msg: 'خطاء');
      }
    });
  }
}
