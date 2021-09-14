import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:get/get.dart';

class MerchantOrderController extends GetxController {
  //TODO: Implement MerchantOrderController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future getOrdersMerchant() async {
    ResponsModel responsModel = await WebServices().getOrdersMerchant();
    if (responsModel.success) {
      Response response = responsModel.data;
      return response.body['data'];
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
