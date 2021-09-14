import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/modules/address_add/views/address_add_view.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_address_controller.dart';

class CartAddressView extends GetView<CartAddressController> {
  var selectaddress = 0.obs;

  @override
  Widget build(BuildContext context) {
    controller.getAddresses();
    return Scaffold(
      appBar: AppBar(
        title: Text('اختيار عنوانك'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Get.offAllNamed(Routes.LAYOUT);
              })
        ],
      ),
      bottomSheet: defaultButton(
          title: 'متابعة',
          onPressed: () {
            Get.toNamed(Routes.CART_PAYMENT);
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(AddressAddView(), fullscreenDialog: true);
                },
                child: Text(
                  'أضافة عنوان جديد',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            listAddresses(),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }

  listAddresses() => Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: FutureBuilder(
                future: controller.FutureList.value,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Column(
                          children: List.generate(
                            snapshot.data.length,
                            (index) => Card(
                              child: Obx(() {
                                return ListTile(
                                  onTap: () {
                                    Kselectaddress.value =
                                        snapshot.data[index]['id'];
                                    selectaddress.value = index;
                                  },
                                  selected: selectaddress.value == index
                                      ? true
                                      : false,
                                  selectedTileColor: Colors.grey[400],
                                  title: Text(snapshot.data[index]['name']),
                                  subtitle: Text(
                                      '${snapshot.data[index]['name']}-${snapshot.data[index]['street']}-${snapshot.data[index]['building']}-${snapshot.data[index]['apartment']}'),
                                );
                              }),
                            ),
                          ),
                        )
                      : Container(
                          child: CustomIndicator(),
                        );
                }),
          ),
        );
      });
}
