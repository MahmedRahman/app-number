import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/department_controller.dart';

class DepartmentView extends GetView<DepartmentController> {
  
  List<String> productImage = [
    'images/product_01.png',
    'images/product_02.png',
    'images/product_03.png',
    'images/product_04.png',
    'images/product_05.png',
    'images/product_05.png',
    'images/product_01.png',
    'images/product_02.png',
    'images/product_03.png',
    'images/product_04.png',
    'images/product_05.png',
    'images/product_05.png',
    'images/product_01.png',
    'images/product_02.png',
    'images/product_03.png',
    'images/product_04.png',
    'images/product_05.png',
    'images/product_05.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            defualtTitle(
              title: 'الاقسام',
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              shrinkWrap: true,
              children: List.generate(
                productImage.length,
                (index) => boxTitle(
                  image: productImage.elementAt(index),
                  title: 'الازياء',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
