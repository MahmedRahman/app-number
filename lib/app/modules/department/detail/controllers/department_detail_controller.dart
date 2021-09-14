import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:get/get.dart';

class DepartmentDetailController extends GetxController {
  //TODO: Implement DepartmentDetailController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  ResponsModel newCategoryProductsRespons;
  Future getCategorieProducts({CategorieProductsid}) async {
   
      newCategoryProductsRespons =
          await WebServices().getCategorieProducts(id: CategorieProductsid);
    
    if (newCategoryProductsRespons.success) {
      Response response = newCategoryProductsRespons.data;
      if (response.body['status']) {
    
          return response.body['data'];
        
      }
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
