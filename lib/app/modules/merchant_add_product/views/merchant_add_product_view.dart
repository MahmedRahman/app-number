import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/merchant_add_product_controller.dart';

class MerchantAddProductView extends GetView<MerchantAddProductController> {
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
      
            defaultTextFormField(hintText: 'الوصف' ,controller: controller.description),
      
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
