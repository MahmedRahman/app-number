import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/merchant_add_product_controller.dart';

class MerchantAddProductView extends GetView<MerchantAddProductController> {
  var subCategory = [
    {
      "id": 7,
      "name": "ساعات رجالي",
      "description": "",
      "image":
          "https://dev.matrixclouds.com/number-one/storage/categories/36421632601085_download (1).jpg"
    },
    {
      "id": 8,
      "name": "ساعات حريمي",
      "description": "",
      "image":
          "https://dev.matrixclouds.com/number-one/storage/categories/42051632601141_3934.jpg"
    },
    {
      "id": 9,
      "name": "ساعات اطفال",
      "description": "",
      "image":
          "https://dev.matrixclouds.com/number-one/storage/categories/19901632601209_download (2).jpg"
    },
    {
      "id": 10,
      "name": "نظارات رجالي",
      "description": "",
      "image":
          "https://dev.matrixclouds.com/number-one/storage/categories/35201632601404_images.jpg"
    },
    {
      "id": 11,
      "name": "نظارات حريمي",
      "description": "",
      "image":
          "https://dev.matrixclouds.com/number-one/storage/categories/27341632601459_25222bde50ef8208e2c10f2ca2160c39d1ffcc0c.jpg"
    }
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضف منتج جديد'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
/*
            DropdownButtonFormField(
              decoration: new InputDecoration(
                filled: true,
                fillColor: KprimaryColor.withOpacity(.1),
                labelText: 'القسم',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
              isExpanded: true,
              value: 1,
              icon: Icon(Icons.keyboard_arrow_down),
              items: List.generate(categoriesItems.length, (index) {




                 return DropdownMenuItem(
                    value: index,
                    child: Text(
                      categoriesItems[index]['name'],
                    ),
                  );

              })
              
              
              ,
              onChanged: (val) {

                //print(val.toString());
               // subCategory.clear();
                print(categoriesItems[val]['subs'].toString());
                //subCategory= categoriesItems[val]['subs'];
                //print(categoriesItems[1]['subs']);
                controller.categoryId.text = val.toString();
              },
            ),
            //defaultTextFormField(hintText: 'القسم'),

            SizedBox(
              height: 20,
            ),
*/
            Obx(() {
              return DropdownButtonFormField(
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: KprimaryColor.withOpacity(.1),
                  labelText: 'اقسام فراعية',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),
                items: List.generate(subCategory.length, (index) {
                  print(subCategory[index]['name']);

                  return DropdownMenuItem(
                    value: subCategory[index]['id'],
                    child: Text(
                      subCategory[index]['name'],
                    ),
                  );
                }),
                onChanged: (val) {
                  print(val);
                  // controller.categoryId.text = val.toString();
                },
              );
            }),

            SizedBox(
              height: 20,
            ),

            defaultTextFormField(
              hintText: 'اسم المنتج',
              controller: controller.productName,
            ),

            SizedBox(
              height: 20,
            ),

            defaultTextFormField(
              hintText: 'الوصف',
              controller: controller.description,
            ),

            SizedBox(
              height: 20,
            ),

            defaultTextFormField(
              hintText: 'السعر',
              controller: controller.price,
              textInputType: TextInputType.number,
            ),

            SizedBox(
              height: 20,
            ),

            defaultTextFormField(
              hintText: 'الخصم',
              controller: controller.discount,
              textInputType: TextInputType.number,
            ),

            SizedBox(
              height: 20,
            ),

            defaultTextFormField(
              hintText: 'عدد القطع المتاحة',
              controller: controller.stock,
              textInputType: TextInputType.number,
            ),

            SizedBox(
              height: 20,
            ),

            defaultButton(
                title: 'اضف',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.addProduct();
                }),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
