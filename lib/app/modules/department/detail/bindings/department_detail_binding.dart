import 'package:get/get.dart';

import '../controllers/department_detail_controller.dart';

class DepartmentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepartmentDetailController>(
      () => DepartmentDetailController(),
    );
  }
}
