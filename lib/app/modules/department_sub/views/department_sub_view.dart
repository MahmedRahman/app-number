import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/department_sub_controller.dart';

class DepartmentSubView extends GetView<DepartmentSubController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قسم فرعى'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          defualtTitle(title: 'جواكيت > ملابس رجالى'),
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
                  image: 'images/subpedart01.png',
                  title: 'جديد',
                  onTap: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                bnt(
                  image: 'images/subpedart02.png',
                  title: 'الأكثر ',
                  onTap: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                bnt(
                  image: 'images/subpedart03.png',
                  title: 'تصفيات',
                  onTap: () {
                    Get.toNamed(Routes.DISCOUNT);
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
          cardItem(),
          SizedBox(
            height: 20,
          ),
          cardItem(),
          SizedBox(
            height: 20,
          ),
          cardItem(),
          SizedBox(
            height: 20,
          ),
          cardItem()
        ],
      ),
    );
  }

  Widget cardItem() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.PRODUCT);
          },
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
                  flex: 1,
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
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'تيشيرات ابيض',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '230 ريال',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: KprimaryColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text('التاجر : '),
                              Text('data')
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: MaterialButton(
                              elevation: 0,
                              color: KprimaryColor.withOpacity(.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.shoppingCart,
                                    color: KprimaryColor,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'اضف الى السلة',
                                    style: TextStyle(
                                        color: KprimaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: KprimaryColor.withOpacity(.3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: KprimaryColor,
                              ),
                              onPressed: () {}),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

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
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
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
