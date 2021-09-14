import 'package:get/get.dart';

import '../controllers/merchant_add_contest_controller.dart';

class MerchantAddContestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantAddContestController>(
      () => MerchantAddContestController(),
    );
  }
}
