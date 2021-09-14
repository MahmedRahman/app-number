import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MerchantProductImageController extends GetxController {
  //TODO: Implement MerchantProductImageController
  var image;
  var product_id;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  var FutureProductsList = Future.value().obs;
  Future getProductsMerchant(product_id) async {
    ResponsModel responsModel =
        await WebServices().getProductMerchant(id: product_id);
    if (responsModel.success) {
      print(responsModel.data.body['data']);
      FutureProductsList.value = Future.value(responsModel.data.body['data']);
      return responsModel.data.body['data'];
    }
  }

  addProductsImages() async {
    ResponsModel responsModel = await WebServices()
        .addProductsImages(product_id: product_id, image: image);
    if (responsModel.success) {
      getProductsMerchant(product_id);
    }
  }

  deleteProductsImage({@required String imageid}) async {

  ResponsModel responsModel = await WebServices()
        .deleteProductsImage(imageid: imageid);
    if (responsModel.success) {
      getProductsMerchant(product_id);
    }

    
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
