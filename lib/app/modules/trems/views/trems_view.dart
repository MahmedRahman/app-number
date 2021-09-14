import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/trems_controller.dart';

class TremsView extends GetView<TremsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سياسة ارجاع السلع'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'سياسة ارجاع السلع',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
