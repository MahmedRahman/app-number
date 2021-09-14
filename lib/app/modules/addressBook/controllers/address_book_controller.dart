import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddressBookController extends GetxController {
  //TODO: Implement AddressBookController

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

  var FutureList = Future.value().obs;

  Future getAddresses() async {
    ResponsModel userAdress;
    userAdress = await WebServices().getAddresses();

    if (userAdress.success) {
      Response response = userAdress.data;
      if (response.body['status']) {
        FutureList.value = Future.value(response.body['data']);

        return response.body['data'];
      }
    }
    return Future.error('خطاء');
  }

  ResponsModel userAdress;
  Future refreshAddresses() async {
    userAdress = await WebServices().getAddresses();

    if (userAdress.success) {
      Response response = userAdress.data;
      if (response.body['status']) {
        return response.body['data'];
      }
    }
    return Future.error('خطاء');
  }

  Future deleteAddresses({@required addressesId}) async {
    ResponsModel responsModel =
        await WebServices().deleteAddresses(addressesId: addressesId);

    if (responsModel.success) {
      Response response = responsModel.data;
      Fluttertoast.showToast(
        msg: response.body['message'],
        toastLength: Toast.LENGTH_SHORT,
      );
    }
    getAddresses();
  }
}
