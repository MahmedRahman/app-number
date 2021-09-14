import 'package:get/get.dart';

import '../controllers/order_book_detail_controller.dart';

class OrderBookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderBookDetailController>(
      () => OrderBookDetailController(),
    );
  }
}
