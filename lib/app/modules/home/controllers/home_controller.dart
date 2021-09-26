import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  ResponsModel categoriesReponse;

  Future getCategories() async {
    if (categoriesReponse == null) {
      categoriesReponse = await WebServices().getCategories();
    }
    if (categoriesReponse.success) {
      Response response = categoriesReponse.data;
      return response.body['data'];
    }
  }

  ResponsModel newProductsRespons;
  Future newProducts() async {
    if (newProductsRespons == null) {
      newProductsRespons = await WebServices().getProducts();
    }
    if (newProductsRespons.success) {
      Response response = newProductsRespons.data;
      if (response.body['status']) {
        return response.body['data'];
      }
    }
  }

  TextEditingController serechval = new TextEditingController();

  getSearchProduct() async {
    ResponsModel responsModel =
        await WebServices().getSearchProduct(search: serechval.text);
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['data'].length == 0) {

       

        Fluttertoast.showToast(msg: 'لا يوجد نتائج');
      
      } else {
      
       // Get.snackbar(appName, response.body['data'].length.toString());
       // Get.to(Serech_view(response.body['data']),fullscreenDialog: true );
    
      
      }
    }
  }

  
  ResponsModel getSliderRespons;
  Future getSlider() async {
   
      getSliderRespons = await WebServices().getSlider();
    
    if (getSliderRespons.success) {
      Response response = getSliderRespons.data;
      if (response.body['status']) {
        return response.body['data'];
      }
    }
  }



  ResponsModel getMerchantsRespons;
  Future getMerchants() async {
   
      getMerchantsRespons = await WebServices().getMerchants();
    
    if (getMerchantsRespons.success) {
      Response response = getMerchantsRespons.data;
      if (response.body['status']) {
        return response.body['data'];
      }
    }
  }

  ResponsModel getStatusesRespons;
  Future getStatuses() async {
    if (getStatusesRespons == null) {
      getStatusesRespons = await WebServices().getStatuses();
    }
    if (getStatusesRespons.success) {
      Response response = getStatusesRespons.data;
      if (response.body['status']) {
        return response.body['data'];
      }
    }
  }
  

  @override
  void onClose() {}
  void increment() => count.value++;
}
