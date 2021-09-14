import 'package:get/get.dart';

import '../controllers/productadd_controller.dart';

class ProductaddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductaddController>(
      () => ProductaddController(),
    );
  }
}
