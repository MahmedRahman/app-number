import 'package:get/get.dart';

import '../controllers/cart_invoice_controller.dart';

class CartInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartInvoiceController>(
      () => CartInvoiceController(),
    );
  }
}
