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
          cardItem(),
          SizedBox(
            height: 10,
          ),
          cardItem(),
          SizedBox(
            height: 10,
          ),
          cardItem(),
          SizedBox(
            height: 50,
          ),
          Container(
            color: KprimaryColor.withOpacity(.3),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'المجموع : 670 جنيه',
                style: TextStyle(
                  color: KprimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MaterialButton(
              elevation: 0,
              height: 60,
              color: KprimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () {},
              child: Text(
                'انشاء طلب',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset('images/product_04.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
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
                  Row(
                    children: [
                      Text('التاجر : '),
                      Image.asset(
                        'images/brand_00.png',
                        width: 32,
                      )
                    ],
                  ),
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                width: 20,
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
