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
                  icon: Icon(FontAwesomeIcons.clock ,color: KprimaryColor,)
                ),
              ),
              Expanded(
                child: btn(
                  title: 'شات',
                    icon: Icon(FontAwesomeIcons.chalkboardTeacher,color: KprimaryColor,)
                ),
              ),
              Expanded(
                child: btn(
                  title: 'مسابقات',
                    icon: Icon(FontAwesomeIcons.wind,color: KprimaryColor,)
                ),
              ),
              Expanded(
                child: btn(
                  title: 'خصومات',
                    icon: Icon(FontAwesomeIcons.powerOff,color: KprimaryColor,)
                ),
              ),
              Expanded(
                child: btn(
                  title: 'كوبون',
                    icon: Icon(FontAwesomeIcons.discord,color: KprimaryColor,)
                ),
              ),
            ]),
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
            ),         SizedBox(height: 20,),
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
  @required Icon icon,
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          )
        ],
      ),
    );
