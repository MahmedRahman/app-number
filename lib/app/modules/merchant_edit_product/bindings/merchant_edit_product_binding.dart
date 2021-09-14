import 'package:get/get.dart';

import '../controllers/merchant_edit_product_controller.dart';

class MerchantEditProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantEditProductController>(
      () => MerchantEditProductController(),
    );
  }
}
