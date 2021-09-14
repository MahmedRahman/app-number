import 'dart:convert';
import 'dart:io';

import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/merchant_add_status_controller.dart';

class MerchantAddStatusView extends GetView<MerchantAddStatusController> {
  final _formKey = GlobalKey<FormState>();
  String base64Image;
  File tmpFile;
  var path = ''.obs;
  XFile image;

  
  @override
  Widget build(BuildContext context) {
    controller.getStatusMerchant();
    return Scaffold(
      appBar: AppBar(
        title: Text('اضف حالة'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                defualtUploadImage(
                    image: 'images/add_photo.png',
                    text: 'اضف صورة مرئية',
                    onTap: () async {
                      final ImagePicker _picker = ImagePicker();

                      image =
                          await _picker.pickImage(source: ImageSource.gallery);

                      path.value = image.path;
                    }),
                defualtUploadImage(
                    image: 'images/add_text.png',
                    text: 'اضف نص مكتوب',
                    onTap: () {
                      Get.defaultDialog(
                        content: addText(),
                        title: 'اضف حالة',
                      );
                    }),
              ],
            ),
            SizedBox(
              height: 10,
            ),
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

                                controller.statusImage = file;
                                controller.statusText.text = 'صورة';

                                controller.addStatusMerchant();

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
                  future: controller.FutureStatusList.value,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data.length == 0
                          ? Center(
                              child: Container(
                                child: Text(
                                  'لا يوجد حالات',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            )
                          : Column(
                              children: List.generate(
                                snapshot.data.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: ListTile(
                                      title: snapshot.data[index]['image'] ==
                                              ""
                                          ? Container()
                                          : SizedBox(
                                            height: 150,
                                            child: Image.network(
                                                snapshot.data[index]['image']),
                                          ),
                                      subtitle: Text(
                                        GetUtils.isNull(
                                                snapshot.data[index]['text'])
                                            ? ''
                                            : snapshot.data[index]['text'],
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          controller.deleteStatusMerchant(
                                              statusId: snapshot.data[index]
                                                  ['id']);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  });
            }),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  defualtUploadImage({
    @required String image,
    @required String text,
    Function onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: KprimaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image),
                SizedBox(
                  height: 20,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );

  Widget addText() {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            TextFormField(
              controller: controller.statusText,
              validator: (String v) =>
                  v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'اكتب النص',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            defaultButton(
              title: 'أضف',
              onPressed: () {
                //FocusScope.of().unfocus();

            

                if (_formKey.currentState.validate()) {
                      Get.back();
                  controller.addStatusMerchant();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
