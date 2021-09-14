import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:get/get.dart';

class OrderBookController extends GetxController {
  //TODO: Implement OrderBookController

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


 ResponsModel ordersBookRespons;
  
  Future getOrdersBook() async {
    
    if (ordersBookRespons == null) {

      ordersBookRespons = await WebServices().getOrdersBook();

    }




    if (ordersBookRespons.success) {

      Response response = ordersBookRespons.data;

      print(response.bodyString);

      if (response.body['status']) {
        return response.body['data'];
      }

    }





  }


}
