import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/department_detail_controller.dart';

class DepartmentDetailView extends GetView<DepartmentDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DepartmentDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DepartmentDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
