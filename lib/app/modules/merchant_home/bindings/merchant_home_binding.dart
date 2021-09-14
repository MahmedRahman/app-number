import 'package:get/get.dart';

import '../controllers/merchant_home_controller.dart';

class MerchantHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantHomeController>(
      () => MerchantHomeController(),
    );
  }
}
