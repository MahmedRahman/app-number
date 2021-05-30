import 'package:get/get.dart';

import '../controllers/department_sub_controller.dart';

class DepartmentSubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepartmentSubController>(
      () => DepartmentSubController(),
    );
  }
}
