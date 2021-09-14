import 'package:get/get.dart';

import '../controllers/merchant_order_controller.dart';

class MerchantOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantOrderController>(
      () => MerchantOrderController(),
    );
  }
}
