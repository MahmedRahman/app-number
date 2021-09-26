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

  var merchants;
  var newest;

  var most_selling;

  var offers;
  var subs;

  Future getCategorieProducts({CategorieProductsid}) async {
    if (GetUtils.isNullOrBlank(newCategoryProductsRespons)) {
      newCategoryProductsRespons = await WebServices().getCategorieProducts(
        id: CategorieProductsid,
      );
    }

    if (newCategoryProductsRespons.success) {
      Response response = newCategoryProductsRespons.data;
      if (response.body['status']) {
        newest = response.body['data']['newest'];

        most_selling = response.body['data']['most_selling'];

        offers = response.body['data']['offers'];
        
        return response.body['data'];
      }
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
