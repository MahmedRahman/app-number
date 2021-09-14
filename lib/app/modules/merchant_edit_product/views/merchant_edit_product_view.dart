import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/merchant_edit_product_controller.dart';

class MerchantEditProductView extends GetView<MerchantEditProductController> {
  var data;
  @override
  Widget build(BuildContext context) {
    data = Get.arguments;

    print(data);
controller.categoryId.text =data[0]['category'].toString(); 
    controller.productName.text = data[0]['name'];
    controller.productId = data[0]['id'].toString();
    controller.description.text = data[0]['description'];
    controller.price.text = data[0]['price'].toString();
    controller.discount.text = data[0]['discount'].toString();
    controller.stock.text = data[0]['stock'].toString();

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
              items: categoriesItems.map((items) {
                return DropdownMenuItem(
                    value: items['id'], child: Text(items['name']));
              }).toList(),
              onChanged: (val) {
                print(val);
                controller.categoryId.text = val.toString();
              },
            ),
            //defaultTextFormField(hintText: 'القسم'),

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
                hintText: 'الوصف', controller: controller.description),

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
                  controller.editProduct();
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
