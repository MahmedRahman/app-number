import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MerchantProfileController extends GetxController {
  //TODO: Implement MerchantProfileController

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

  subscribeRequestMerchant() async {
    ResponsModel responsModel = await WebServices().subscribeRequestMerchant();

    if (responsModel.success) {
      Response response = responsModel.data;

      if (response.body['status']) {
        Fluttertoast.showToast(msg: 'تم الاشترك بنجاح');
      } else {
        Fluttertoast.showToast(msg: 'خطاء فى الاشترك');
      }
    }
  }


}
