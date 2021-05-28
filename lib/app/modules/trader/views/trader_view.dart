import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'سلسلة محلات الدلتا ',
                      style: TextStyle(
                          color: KprimaryColor, fontWeight: FontWeight.bold),
                    ),
                    Text('ملابس منوعة / القاهرة '),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  onPressed: () {},
                  color: KprimaryColor.withOpacity(.1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Text(
                    'تابع',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: KprimaryColor),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            child: Icon(
                              FontAwesomeIcons.archway,
                              color: KprimaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ابلاغ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: KprimaryColor.withOpacity(.5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Center(
                          child: Text(
                            'السلع',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'موجز',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: KprimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
