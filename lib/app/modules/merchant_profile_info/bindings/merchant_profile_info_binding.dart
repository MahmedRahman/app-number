import 'package:get/get.dart';

import '../controllers/merchant_profile_info_controller.dart';

class MerchantProfileInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantProfileInfoController>(
      () => MerchantProfileInfoController(),
    );
  }
}
