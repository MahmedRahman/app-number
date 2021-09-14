import 'package:get/get.dart';

import '../controllers/merchant_product_controller.dart';

class MerchantProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantProductController>(
      () => MerchantProductController(),
    );
  }
}
