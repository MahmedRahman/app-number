import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/merchant_product/controllers/merchant_product_controller.dart';
import 'package:app_number/app/modules/product/controllers/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MerchantAddProductController extends GetxController {
  TextEditingController categoryId = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController description = TextEditingController();

  TextEditingController price = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController stock = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    categoryId.text = '1';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  addProduct() async {
    ResponsModel responsModel = await WebServices().addProductsMerchant(
      categoryId: categoryId.text,
      description: description.text,
      productName: productName.text,
      price: price.text,
      discount: discount.text,
      stock: stock.text,
    );

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
      MerchantProductController controller = Get.find();
      controller.getProductsMerchant();
      Get.back();
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
