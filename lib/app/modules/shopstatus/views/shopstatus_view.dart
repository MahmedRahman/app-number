import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/shopstatus_controller.dart';

class ShopstatusView extends GetView<ShopstatusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                 SizedBox(
              width: 20,
            ),
                Expanded(child: Text('سلسلة محلات الدلتا')),
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Get.back();
                    })
              ],
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
                Text(
                  'منذ 12 س',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: KprimaryColor,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.red,
                child: Image.asset(
                  'images/bg_image.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(hintText: 'اكتب'),
                )),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                )
              ],
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
