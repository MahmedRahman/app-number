import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/discount_controller.dart';

class DiscountView extends GetView<DiscountController> {
  var data;
  @override
  Widget build(BuildContext context) {
    data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('خصومات'),
        centerTitle: true,
      ),
      body: data.length == 0
          ? Center(
              child: Container(
                child: Text(
                  'لا يوجد خصومات',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
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
                          'MMM',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor),
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
                ),
                /*
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                imageList.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: index == 1 ? KprimaryColor : Colors.white)),
                    child: Column(
                      children: [
                        Image.asset('images/product_01.png'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'احذية و حقائب',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: KprimaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),*/ /*
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'العروض الكبرى في منطقتك',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('باقى'),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Container(
                            color: KprimaryColor.withOpacity(.5),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '12',
                                style: TextStyle(color: KprimaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('أيام')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            color: KprimaryColor.withOpacity(.5),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '12',
                                style: TextStyle(color: KprimaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('ساعات'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            color: KprimaryColor.withOpacity(.5),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '12',
                                style: TextStyle(color: KprimaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('دقائق'),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
      */
                Column(
                  children: List.generate(
                    data.length,
                    (index) => cardItem(
                      name: data[index]['name'],
                      price: data[index]['price'].toString(),
                      imageUrl: data[index]['cover'].toString(),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget cardItem({
    @required String name,
    @required String price,
    @required String imageUrl,
  }) =>
      Padding(
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
                    child: CustomImageCached(
                      imageUrl: imageUrl,
                    ),
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
                          name,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$price ريال',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor),
                        ),
                        SizedBox(
                          height: 15,
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
      );
}
