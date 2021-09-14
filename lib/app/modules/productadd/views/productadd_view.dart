import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/productadd_controller.dart';

class ProductaddView extends GetView<ProductaddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductaddView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                'اضف منتج جديد',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: KprimaryColor.withOpacity(.1),
                hintText: 'اسم المنتج',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: KprimaryColor.withOpacity(.1),
                hintText: 'القسم',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: KprimaryColor.withOpacity(.1),
                hintText: 'اضف صورة',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: KprimaryColor.withOpacity(.1),
                hintText: 'السعر',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: KprimaryColor.withOpacity(.1),
                hintText: 'الخصم',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: KprimaryColor.withOpacity(.1),
                hintText: 'المقاس',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: KprimaryColor.withOpacity(.1),
                hintText: 'اللون',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: KprimaryColor.withOpacity(.1),
                hintText: 'الوصف',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
