import 'package:get/get.dart';

import '../controllers/merchant_bord_controller.dart';

class MerchantBordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantBordController>(
      () => MerchantBordController(),
    );
  }
}
