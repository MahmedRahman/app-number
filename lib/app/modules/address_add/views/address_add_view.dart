import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/address_add_controller.dart';

class AddressAddView extends GetView<AddressAddController> {
  AddressAddController controller = Get.put(AddressAddController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أضافة عنوان'),
        centerTitle: true,
      ),
      bottomSheet: defaultButton(
          title: 'اضافة',
          onPressed: () {
            
            FocusScope.of(context).unfocus();
             if (_formKey.currentState.validate()) {
                controller.addAddresses();
              }
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              defaultTextFormField(
                hintText: 'العنوان',
                controller: controller.name,
                validator: (String v) =>
                    v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
              ),
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                hintText: 'المنطقة',
                controller: controller.area,
                validator: (String v) =>
                    v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
              ),
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                hintText: 'الشارع',
                controller: controller.street,
                validator: (String v) =>
                    v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
              ),
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                hintText: 'رقم المبنى',
                controller: controller.building,
                textInputType: TextInputType.number,
                validator: (String v) =>
                    v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
              ),
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                hintText: 'رقم الشقة',
                controller: controller.apartment,
                textInputType: TextInputType.number,
                validator: (String v) =>
                    v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
