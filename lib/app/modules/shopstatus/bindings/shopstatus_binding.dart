import 'package:get/get.dart';

import '../controllers/shopstatus_controller.dart';

class ShopstatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopstatusController>(
      () => ShopstatusController(),
    );
  }
}
