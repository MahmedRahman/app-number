import 'package:get/get.dart';

import '../controllers/merchant_add_coupon_controller.dart';

class MerchantAddCouponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantAddCouponController>(
      () => MerchantAddCouponController(),
    );
  }
}
