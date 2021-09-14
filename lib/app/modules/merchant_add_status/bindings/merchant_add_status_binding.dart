import 'package:get/get.dart';

import '../controllers/merchant_add_status_controller.dart';

class MerchantAddStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantAddStatusController>(
      () => MerchantAddStatusController(),
    );
  }
}
