import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/trader_controller.dart';

class TraderView extends GetView<TraderController> {
  @override
  Widget build(BuildContext context) {
  
     List<String> imageList = [
      'images/brand_00.png',
      'images/brand_01.png',
      'images/brand_02.png',
      'images/brand_03.png',
      'images/brand_02.png',
      'images/brand_03.png',
      'images/brand_00.png',
      'images/brand_01.png',
      'images/brand_02.png',
      'images/brand_03.png',
      'images/brand_02.png',
      'images/brand_03.png',
      'images/brand_00.png',
      'images/brand_01.png',
      'images/brand_02.png',
      'images/brand_03.png',
      'images/brand_02.png',
      'images/brand_03.png',
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            defualtTitle(
              title: 'التجار الشائعين',
            ),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(
                    imageList.length,
                    (index) => box(
                      image: imageList.elementAt(index),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
 
  }
}
