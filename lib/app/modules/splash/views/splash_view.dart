import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: RadialGradient(
          center: Alignment(0, 0), // near the top right
          radius: .6,
          colors: [
            Color(0xffE8106B),
            Color(0xff67236C),
          ],
        )),
        child: Text('أبداء' ,style: TextStyle(color: Colors.white),)
      ),
    );
  }
}
