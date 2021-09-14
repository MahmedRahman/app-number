import 'package:get/get.dart';

import '../controllers/cart_address_controller.dart';

class CartAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartAddressController>(
      () => CartAddressController(),
    );
  }
}
