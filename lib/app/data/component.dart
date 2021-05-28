import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/notifaction/views/notifaction_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget defualtTitle({
  @required String title,
  String textButtontitle = '',
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffAE1D6D),
                    Color(0xffCC1569),
                  ],
                ),
                color: KprimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  textButtontitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: KprimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget box({
  @required String image,
  Function onclick,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          border: Border.all(
            width: 2,
            color: KprimaryColor,
          ),
        ),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          splashColor: KprimaryColor.withOpacity(.5),
          color: Colors.white,
          onPressed: onclick,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: 60,
              height: 60,
              child: Image.asset(
                image,
              ),
            ),
          ),
        ),
      ),
    );

Widget boxCircle({
  @required String image,
  Function onclick,
}) =>
    InkWell(
      onTap: onclick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: KprimaryColor, width: 2),
          ),
          child: Image.asset(
            image,
            width: 80,
            height: 80,
          ),
        ),
      ),
    );

Widget boxTitle({
  @required String image,
  @required String title,
  Function onclick,
}) =>
    InkWell(
      onTap: onclick,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        //bottomRight: Radius.circular(18),
                        topLeft: Radius.circular(18),
                      ),
                      //borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    )),
              ),
              Divider(
                height: 2,
                thickness: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: KprimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget productBox({
  @required String image,
  Function onClick,
}) =>
    InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 180,
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
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'تيشيرت ابيض',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '230',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: KprimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'جنيه',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: KprimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'التاجر',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'images/brand_00.png',
                        width: 32,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    elevation: 0,
                    color: KprimaryColor.withOpacity(.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {},
                    child: Text(
                      'اضف الى السلة',
                      style: TextStyle(
                        color: KprimaryColor,
                        fontWeight: FontWeight.bold,
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
                    color: Colors.white,
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
              ),
            ],
          ),
        ),
      ),
    );

Widget customAppBar({Function onMenuClick}) => PreferredSize(
      preferredSize: Size.fromHeight(90),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          overflow: Overflow.visible,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: SvgPicture.asset('images/notifaction.svg'),
                    onPressed: () {
                      Get.to(
                        NotifactionView(),
                        fullscreenDialog: true,
                      );
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset('images/notifaction.svg'),
                    onPressed: () {
                      Get.to(
                        NotifactionView(),
                        fullscreenDialog: true,
                      );
                    },
                  )
                ],
              ),
            ),
            Positioned(
              bottom: -30,
              child: Container(
                width: Get.width * .7,
                height: 60,
                color: Colors.transparent,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(50),
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        'images/preferences_icon.svg',
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        'images/serech_icon.svg',
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
