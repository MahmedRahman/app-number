import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:get/get.dart';

class CartAddressController extends GetxController {
  //TODO: Implement CartAddressController

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

  var FutureList = Future.value().obs;
  Future getAddresses() async {
    ResponsModel userAdress;
    userAdress = await WebServices().getAddresses();

    if (userAdress.success) {
      Response response = userAdress.data;
      if (response.body['status']) {
        FutureList.value = Future.value(response.body['data']);
        return response.body['data'];
      }
    }
    return Future.error('خطاء');
  }
}
