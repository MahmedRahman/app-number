import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  final count = 0.obs;

  getCouponsMerchant() async {
    ResponsModel responsModel = await WebServices().getCouponsMerchant();
    if (responsModel.success) {
      Response response = responsModel.data;
      return response.body['data'];
    }
  }

  addCouponsMerchant({
    @required name,
    @required discount,
    @required expireAt,
    @required start_at,
  }) async {
    ResponsModel responsModel = await WebServices().addCouponsMerchant(
      name: name,
      discount: discount,
      expireAt: expireAt,
      start_at: start_at,
    );

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['status']) {
        Get.snackbar(Appname, response.body['message']);
      } else {
        Get.snackbar(Appname, response.body['message']);
      }
    }
  }

  deleteCouponsMerchant({@required couponsId}) async {
    ResponsModel responsModel =
        await WebServices().deleteCouponsMerchant(couponsId: couponsId);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['status']) {
        Get.snackbar(Appname, response.body['message']);
      } else {
        Get.snackbar(Appname, response.body['message']);
      }
    }
  }
}
