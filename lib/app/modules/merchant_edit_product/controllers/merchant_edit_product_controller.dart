import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/modules/merchant_product/controllers/merchant_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MerchantEditProductController extends GetxController {
  //TODO: Implement MerchantEditProductController

   TextEditingController categoryId = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController description = TextEditingController();

  TextEditingController price = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController stock = TextEditingController();
  var productId;

  editProduct() async {
    ResponsModel responsModel = await WebServices().editProductsMerchant(
      productId:productId ,
      categoryId: '1',
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
}
