import 'package:get/get.dart';

import '../controllers/trems_controller.dart';

class TremsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TremsController>(
      () => TremsController(),
    );
  }
}
