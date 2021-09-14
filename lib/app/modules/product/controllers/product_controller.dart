import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  TextEditingController inputQty = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    inputQty.text = '1';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future getProduct({productid}) async {
    ResponsModel ProductsRespons =
        await WebServices().getProduct(id: productid);

    if (ProductsRespons.success) {
      Response response = ProductsRespons.data;
      if (response.body['status']) {
        return response.body['data'];
      }
    }
  }

  Future addcart({productid}) async {
    await WebServices()
        .addCart(product_id: productid, quantity: 1)
        .then((value) {
      Response response = value.data;
      if (response.body['status']) {
        Get.snackbar(Appname, response.body['message'],
            snackbarStatus: (snackbarStatus) {
          if (snackbarStatus == SnackbarStatus.CLOSED) {
            Get.toNamed(Routes.CART);
          }
        });
      } else {
        Get.snackbar(Appname, response.body['message']);
      }
    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
