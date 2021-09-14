import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/callus_controller.dart';

class CallusView extends GetView<CallusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اتصل بنا'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'اتصل بنا',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
