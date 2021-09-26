import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/modules/department/detail/views/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  //TODO: Implement LayoutController

  TextEditingController serechText = TextEditingController();

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

  getSearchProduct() async {
    ResponsModel responsModel =
        await WebServices().getSearchProduct(search: serechText.text);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['status']) {
        if (response.body['data'].length == 0) {
          Fluttertoast.showToast(msg: 'لا يوجد منتجات');
        } else {
          Get.to(
            ProductViewList(),
            fullscreenDialog: true,
            arguments: [response.body['data']],
          );
        }
      } else {
        Fluttertoast.showToast(msg: 'خطاء');
      }
    }
  }
}
