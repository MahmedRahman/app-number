import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MerchantAddCouponController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController expire = TextEditingController();
  TextEditingController start = TextEditingController();
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void ClearData() {
    name.clear();
    discount.clear();
    expire.clear();
  }

  var FutureStatusList = Future.value().obs;

  Future getCouponsMerchant() async {
    ResponsModel responsModel = await WebServices().getCouponsMerchant();
    if (responsModel.success) {
      FutureStatusList.value = Future.value(responsModel.data.body['data']);

      return responsModel.data.body['data'];
    }
  }

  Future addCouponsMerchant() async {
    if (GetUtils.isNullOrBlank(start.text) &
        GetUtils.isNullOrBlank(expire.text)) {
      Fluttertoast.showToast(msg: 'خطاء فى تاريخ البداية او النهاية');
    } else {
      ResponsModel responsModel = await WebServices().addCouponsMerchant(
        name: name.text,
        discount: discount.text,
        expireAt: expire.text,
        start_at: start.text,
      );

      ClearData();
      Get.back();

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

        getCouponsMerchant();
      }
    }
  }

  deleteCouponsMerchant({@required couponsId}) async {
    ResponsModel responsModel =
        await WebServices().deleteCouponsMerchant(couponsId: couponsId);

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
      getCouponsMerchant();
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
