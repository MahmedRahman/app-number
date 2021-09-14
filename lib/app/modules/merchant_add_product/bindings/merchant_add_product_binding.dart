import 'package:get/get.dart';

import '../controllers/merchant_add_product_controller.dart';

class MerchantAddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantAddProductController>(
      () => MerchantAddProductController(),
    );
  }
}
