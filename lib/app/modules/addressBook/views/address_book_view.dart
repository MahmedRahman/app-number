import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/modules/address_add/views/address_add_view.dart';
import 'package:flutter/material.dart';
import 'package:app_number/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/address_book_controller.dart';

class AddressBookView extends GetView<AddressBookController> {
  @override
  Widget build(BuildContext context) {
    controller.getAddresses();
    return Scaffold(
      appBar: AppBar(
        title: Text('اختيار عنوانك'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                 onTap: () {
                      Get.to(AddressAddView(), fullscreenDialog: true);
                    },
                child: Container(
                  color: KprimaryColor.withOpacity(.2),
                  height: 60,
                  child: Center(
                    child: Text(
                      'أضافة عنوان جديد',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
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

  listAddresses() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Obx(
            () {
              return FutureBuilder(
                  future: controller.FutureList.value,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? snapshot.data.length ==0 ? Container(child: Text('لا يوجد عناوين'),) : Column(
                            children: List.generate(
                              snapshot.data.length,
                              (index) => Card(
                                child: ListTile(
                                  trailing: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        controller.deleteAddresses(
                                            addressesId: snapshot.data[index]
                                                ['id']);
                                      }),
                                  onTap: () {
                                    // selectaddress.value = index;
                                  },
                                  selected: false,
                                  //selectaddress.value == index ? true : false,
                                  selectedTileColor: Colors.grey[400],
                                  title: Text(snapshot.data[index]['name']),
                                  subtitle: Text(
                                      '${snapshot.data[index]['name']}-${snapshot.data[index]['street']}-${snapshot.data[index]['building']}-${snapshot.data[index]['apartment']}'),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            child: Center(child: CustomIndicator())
                          );
                  });
            }
          ),
        ),
      );
}
