import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/department_detail_controller.dart';

class DepartmentDetailView extends GetView<DepartmentDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاقسام - الازياء'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                bnt(
                  image: 'images/depart01.svg',
                  title: 'جديد',
                  onTap: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                bnt(
                  image: 'images/depart02.svg',
                  title: 'الأكثر ',
                  onTap: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                bnt(
                  image: 'images/depart03.svg',
                  title: 'تصفيات',
                  onTap: () {
                    Get.toNamed(Routes.DISCOUNT);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                bnt(
                  image: 'images/depart04.svg',
                  title: 'مسابقات',
                  onTap: () {
                    Get.toNamed(Routes.QUIZ);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),
          defualtTitle(
            title: 'تجار القسم',
          ),

          SizedBox(
            height: 20,
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
            height: 20,
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
            height: 20,
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
                  onclick: () {
                    Get.toNamed(Routes.PRODUCT);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget bnt({
    @required String image,
    @required String title,
    Function onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Container(
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: SvgPicture.asset(image),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      );



}
