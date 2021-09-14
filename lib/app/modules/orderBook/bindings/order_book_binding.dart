import 'package:get/get.dart';

import '../controllers/order_book_controller.dart';

class OrderBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderBookController>(
      () => OrderBookController(),
    );
  }
}
