import 'package:get/get.dart';

import '../controllers/merchant_product_image_controller.dart';

class MerchantProductImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantProductImageController>(
      () => MerchantProductImageController(),
    );
  }
}
