import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/merchant_product_controller.dart';

class MerchantProductView extends GetView<MerchantProductController> {
  MerchantProductController controller = Get.put(MerchantProductController());

  @override
  Widget build(BuildContext context) {
    controller.getProductsMerchant();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.MERCHANT_ADD_PRODUCT);
        },
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          defualtTitle(title: 'منتجات التاجر'),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            return FutureBuilder(
                future: controller.FutureProductsList.value,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data.length == 0
                        ? Center(
                            child: Container(
                              child: Text(
                                'لا يوجد منتجات',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        : Column(
                            children: List.generate(
                              snapshot.data.length,
                              (index) => productItem(
                                productId: snapshot.data[index]['id'],
                                productName: snapshot.data[index]['name'],
                                price: snapshot.data[index]['price'],
                                qty: snapshot.data[index]['stock'],
                                imageUrl:
                                    snapshot.data[index]['images'].length == 0
                                        ? ''
                                        : snapshot.data[index]['images'][0]
                                            ['image'],
                                onPressed: () {
                                  controller.deleteProductsMerchant(
                                    productId: snapshot.data[index]['id'],
                                  );
                                },
                                onEdit :(){
                                  Get.toNamed(Routes.MERCHANT_EDIT_PRODUCT,arguments: [snapshot.data[index]]);
                                }
                              ),
                            ),
                          );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                });
          }),
        ],
      ),
    );
  }
}

Widget productItem(
        {@required productId,
        @required productName,
        @required price,
        @required qty,
        @required imageUrl,
        Function onPressed,
        Function onEdit}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: KprimaryColor),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 150,
                        child: CustomImageCached(imageUrl: imageUrl),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        productName,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$price ريال',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: KprimaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$qty قطع متاحة',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: KprimaryColor),
                      ),
                      Divider(
                        color: KprimaryColor,
                      ),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.add_a_photo,
                                color: KprimaryColor,
                              ),
                              onPressed: () {
                                Get.toNamed(Routes.MERCHANT_PRODUCT_IMAGE,
                                    arguments: [productId]);
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: KprimaryColor,
                              ),
                              onPressed: onEdit),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: KprimaryColor,
                              ),
                              onPressed: onPressed),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
