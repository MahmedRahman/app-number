import 'package:get/get.dart';

import '../controllers/callus_controller.dart';

class CallusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallusController>(
      () => CallusController(),
    );
  }
}
