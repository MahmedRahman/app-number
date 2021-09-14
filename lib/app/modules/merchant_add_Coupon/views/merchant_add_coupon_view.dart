import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/merchant_add_coupon_controller.dart';
import 'package:intl/intl.dart';

import 'package:app_number/app/data/validation.dart';

class MerchantAddCouponView extends GetView<MerchantAddCouponController> {
  final _formKey = GlobalKey<FormState>();
  var date = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString().obs;
  @override
  Widget build(BuildContext context) {
    controller.getCouponsMerchant();

    return Scaffold(
      appBar: AppBar(
        title: Text('أكواد الخصم'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.defaultDialog(
              title: 'اضافة كود الخصم', content: addCoupon(context));
        },
      ),
      body: Obx(() {
        return FutureBuilder(
            future: controller.FutureStatusList.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.length == 0
                    ? Center(
                        child: Container(
                          child: Text(
                            'لا يوجد اكواد خصم',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Column(
                            children: List.generate(
                              snapshot.data.length,
                              (index) => Card(
                                child: ListTile(
                                  title: Text(snapshot.data[index]['name']),
                                  subtitle: Text(
                                      '${snapshot.data[index]['expire_at']} / ${snapshot.data[index]['discount']}%'),
                                  leading: Icon(Icons.label),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      controller.deleteCouponsMerchant(
                                          couponsId: snapshot.data[index]['id']
                                              .toString());
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
              } else {
                return CircularProgressIndicator();
              }
            });
      }),
    );
  }

  void showdate(context) async {
    DateTime pickedDate = await showDatePicker(
      context: context, //context of current state
      initialDate: DateTime.now(),
      firstDate: DateTime
          .now(), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      date.value = formattedDate;
      controller.expire.text = formattedDate;
      //formatted date output using intl package =>  2021-03-16
    } else {
      print("Date is not selected");
    }
  }

  Form addCoupon(context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          defaultTextFormField(
            hintText: 'الاسم',
            controller: controller.name,
            validator: (String v) =>
                v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
          ),
          SizedBox(
            height: 20,
          ),
          defaultTextFormField(
            hintText: 'النسبة',
            controller: controller.discount,
            textInputType: TextInputType.number,
            validator: (String v) =>
                v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() {
            return SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {
                  showdate(context);
                },
                child: Text(date.value.toString()),
              ),
            );
          }),
          SizedBox(
            height: 20,
          ),
          defaultButton(
            title: 'أضف',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                controller.addCouponsMerchant();
              }
            },
          )
        ],
      ),
    );
  }
}
