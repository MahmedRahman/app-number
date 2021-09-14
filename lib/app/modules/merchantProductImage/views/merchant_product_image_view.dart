import 'dart:io';

import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/merchant_product_image_controller.dart';

class MerchantProductImageView extends GetView<MerchantProductImageController> {
  var productId;
  var image;
  var path = ''.obs;
  @override
  Widget build(BuildContext context) {
    productId = Get.arguments[0].toString();
    controller.getProductsMerchant(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('صور المنتج'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return path.value == ''
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            child: Image.file(
                              File(path.value),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: () {
                                File file = File(image.path);

                                controller.image = file;
                                controller.product_id = productId;
                                controller.addProductsImages();
                                path.value = '';
                              },
                              child: Text('رفع'),
                            ),
                          )
                        ],
                      ),
                    );
            }),
            Obx(() {
              return FutureBuilder(
                  future: controller.FutureProductsList.value,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? snapshot.data['images'].length == 0
                            ? Text('لا يوجد صور')
                            : Column(
                                children: List.generate(
                                  snapshot.data['images'].length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: Get.width,
                                          color: Colors.black,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 250,
                                              child: CustomImageCached(
                                                imageUrl:
                                                    snapshot.data['images']
                                                        [index]['image'],
                                              ),
                                            ),
                                          ),
                                        ),
                                        defaultButton(
                                          title: 'حذف',
                                          onPressed: () {
                                            controller.deleteProductsImage(
                                              imageid: snapshot.data['images'][index]['id'].toString()
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                        : CircularProgressIndicator();
                  });
            }),
            InkWell(
              onTap: () async {
                final ImagePicker _picker = ImagePicker();
                image = await _picker.pickImage(source: ImageSource.gallery);
                path.value = image.path;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: Center(
                    child: Text(
                      'اضافة صورة المنتج',
                      style: TextStyle(
                          fontSize: 18,
                          color: KprimaryColor.withOpacity(.5),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
