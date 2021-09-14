import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
/*
    issplash==false ?
    Future.delayed(Duration(seconds: 1), () {
      print('object');
      Get.toNamed(Routes.LAYOUT);
      issplash=true;
    }):issplash=false;
*/

    return Scaffold(
      body: InkWell(
        onTap: () {
          Get.toNamed(Routes.LAYOUT);
        },
        child: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/number.png'),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'N u m b e r',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'اهلا بك',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15.0),
                                topLeft: Radius.circular(15.0),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.offNamed(Routes.LAYOUT);
                              },
                              child: Image.asset(
                                'images/type_1.png',
                                color: KprimaryColor,
                                width: 32,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'المستخدم',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                       width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.SIGNIN, arguments: [1]);
                              },
                              child: Image.asset(
                                'images/type_0.png',
                                color: KprimaryColor,
                                width: 32,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('التاجر' ,style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
