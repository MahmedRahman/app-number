import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget defualtTitle({
  @required String title,
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
                    KprimaryColor,
                    KprimaryColor.withOpacity(.6),
                    KprimaryColor.withOpacity(1),
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
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.arrowAltCircleDown,
                  size: 16,
                  color: Colors.black,
                ),
                label: Text(
                  'عرض الكل',
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

Widget box({@required String image}) => Padding(
      padding: const EdgeInsets.all(8.0),
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
    );

Widget boxCircle({@required String image}) => Padding(
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
    );

Widget boxTitle({
  @required String image,
  @required String title,
}) =>
    Padding(
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
    );

Widget productBox({@required String image}) => Padding(
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
        child: Column(
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
                Text(
                  'جنيه',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
         
         
            MaterialButton(
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
      ),
    );
