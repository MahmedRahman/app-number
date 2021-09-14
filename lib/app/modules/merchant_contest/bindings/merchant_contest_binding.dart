import 'package:get/get.dart';

import '../controllers/merchant_contest_controller.dart';

class MerchantContestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantContestController>(
      () => MerchantContestController(),
    );
  }
}
