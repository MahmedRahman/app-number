import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  FavouriteController controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    controller.getWishlist();
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          defualtTitle(title: 'قائمة الامنيات'),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            return FutureBuilder(
                future: controller.FutureList.value,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data['data'].length == 0
                        ? Container(
                            child: Center(child: Text('لا يوجد مفضلة')),
                          )
                        : Column(
                            children: List.generate(
                              snapshot.data['data'].length,
                              (index) => cardItem(snapshot.data['data'][index]),
                            ),
                          );
                  } else {
                    return Container(
                      child: Center(child: CustomIndicator()),
                    );
                  }
                });
          }),
        ],
      ),
    );
  }

  Widget cardItem(snapshot) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
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
                        child: CustomImageCached(imageUrl: snapshot['cover']),
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
                              snapshot['name'],
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${snapshot['price']} ريال',
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
                                Text(snapshot['merchant']['name'])
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: Get.width * .4,
                    child: defaultButton(
                        onPressed: () async {
                          cartProducts.add(
                            new productItem(
                              productsid: snapshot.data['id'],
                              productsName: snapshot.data['name'],
                              productsPrice: snapshot.data['price'],
                              productsImage: snapshot.data['cover'],
                              qty: 1,
                            ),
                          );
                          Fluttertoast.showToast(msg: 'تم الاضافة الى السلة');
                        },
                        title: 'اضف الى السلة'),
                  ),
                  Container(
                    width: Get.width * .4,
                    child: defaultButton(
                        onPressed: () {
                          controller.deleteWishlist(
                            productid: snapshot['id'].toString(),
                          );
                        },
                        title: 'حذف'),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
}
