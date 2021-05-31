import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/trader_controller.dart';

class TraderView extends GetView<TraderController> {
  var sel_flg = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التاجر'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: KprimaryColor,
                      width: 1.0,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      FontAwesomeIcons.shoppingBag,
                      color: KprimaryColor,
                    ),
                    radius: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'سلسلة محلات الدلتا ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: KprimaryColor),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  elevation: 0,
                  color: KprimaryColor.withOpacity(.1),
                  onPressed: () {},
                  child: Text(
                    'تابع',
                    style: TextStyle(
                      color: KprimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: btn(
                  title: 'ابلاغ',
                  icon: SvgPicture.asset('images/icion_1.svg'),
                ),
              ),
              Expanded(
                child: btn(
                  title: 'شات',
                  icon: SvgPicture.asset('images/icion_2.svg'),
                ),
              ),
              Expanded(
                child: btn(
                  title: 'مسابقات',
                  icon: SvgPicture.asset('images/icion_3.svg'),
                  onclick: () {
                    Get.toNamed(Routes.QUIZ);
                  },
                ),
              ),
              Expanded(
                child: btn(
                  title: 'خصومات',
                  icon: SvgPicture.asset('images/icion_4.svg'),
                  onclick: () {
                    Get.toNamed(Routes.DISCOUNT);
                  },
                ),
              ),
              Expanded(
                child: btn(
                  title: 'كوبون',
                  icon: SvgPicture.asset('images/icion_5.svg'),
                  onclick: (){
                       Get.toNamed(Routes.COUPON);
                  }
                ),
              ),
            ]),
            SizedBox(
              height: 40,
            ),
            Obx(
              () {
                return Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                sel_flg.value = false;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: sel_flg.value
                                      ? Colors.white
                                      : KprimaryColor.withOpacity(.5),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
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
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                sel_flg.value = true;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: sel_flg.value
                                      ? KprimaryColor.withOpacity(.5)
                                      : Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    sel_flg.value == false
                        ? Column(
                            children: [
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
                                      Get.toNamed(Routes.DEPARTMENT_SUB);
                                    },
                                  ),
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
                            ],
                          )
                        : GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            children: List.generate(
                              productImage.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(15),
                                child: Stack(
                                  alignment: Alignment.topLeft,
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: Image.asset(
                                        productImage.elementAt(index),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 64,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          FontAwesomeIcons.image,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Widget btn({
  @required String title,
  @required Widget icon,
  Function onclick,
}) =>
    InkWell(
      onTap: onclick,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: icon,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
