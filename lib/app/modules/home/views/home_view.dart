import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: FittedBox(
              alignment: Alignment.topCenter,
              child: Image.asset('images/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          defualtTitle(
            title: 'التجار الشائعين',
          ),

////////////

          SizedBox(
            height: 10,
          ),

////////////

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                imageList.length,
                (index) => box(
                    image: imageList.elementAt(index),
                    onclick: () {
                      Get.toNamed(Routes.TRADER);
                    }),
              ),
            ),
          ),

          /////////////
          SizedBox(
            height: 10,
          ),
          defualtTitle(title: 'احدث الحالات'),

          /////

          SizedBox(
            height: 10,
          ),

//circle

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                imageList.length,
                (index) => Column(
                  children: [
                    boxCircle(
                        image: imageList.elementAt(index),
                        onclick: () {
                          Get.toNamed(Routes.SHOPSTATUS);
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'امجاد',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: KprimaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 10,
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

          SizedBox(
            height: 10,
          ),
          defualtTitle(title: 'اقسام فرعية', textButtontitle: 'عرض الكل'),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Center(
                      child: Text(
                        'نساء',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: KprimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
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
                          'رجال',
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
                      'اطفال',
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

          SizedBox(
            height: 10,
          ),

          defualtTitle(
            title: 'احدث المنتجات',
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                10,
                (index) => productBox(
                  image: productImage.elementAt(1),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
