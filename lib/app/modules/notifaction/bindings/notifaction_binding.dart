import 'package:get/get.dart';

import '../controllers/notifaction_controller.dart';

class NotifactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifactionController>(
      () => NotifactionController(),
    );
  }
}
