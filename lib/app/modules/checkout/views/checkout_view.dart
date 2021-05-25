import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          defualtTitle(title: 'سلة المشتريات'),
          SizedBox(
            height: 10,
          ),
          cardItem(),
          SizedBox(
            height: 10,
          ),
          cardItem(),       SizedBox(
            height: 10,
          ),
          cardItem(),SizedBox(
            height: 10,
          ),
          cardItem(),
        ],
      ),
    );
  }

  Widget cardItem() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: FittedBox(
                    child: Image.asset('images/product_01.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('تيشيرات ابيض'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '230 جنية',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: KprimaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('التاجر : محمود'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            border: Border.all(color: KprimaryColor, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: KprimaryColor),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            border: Border.all(color: KprimaryColor, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: KprimaryColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      );
}
