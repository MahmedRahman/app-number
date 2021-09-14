import 'package:get/get.dart';

import '../controllers/cart_payment_controller.dart';

class CartPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartPaymentController>(
      () => CartPaymentController(),
    );
  }
}
