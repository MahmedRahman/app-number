import 'dart:io';

import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/merchant_profile_info_controller.dart';

class MerchantProfileInfoView extends GetView<MerchantProfileInfoController> {
  var path = ''.obs;
  XFile image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('البروفايل'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.keyboard),
              onPressed: () {
                Get.defaultDialog(
                    content: Column(
                  children: [
                    defaultTextFormField(
                        hintText: 'الباسورد القديم',
                        controller: controller.oldPassword),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextFormField(
                        hintText: 'الباسورد الجديد',
                        controller: controller.newPassword),
                    SizedBox(
                      height: 15,
                    ),
                    defaultButton(
                      title: 'حفظ',
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        controller.profileChangePassword();
                      },
                    )
                  ],
                ));
              })
        ],
      ),
      body: FutureBuilder(
          future: controller.getProfileMerchant(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    defualtUploadImage(
                        image: 'images/add_photo.png',
                        text: 'اضف صورة مرئية',
                        onTap: () async {
                          final ImagePicker _picker = ImagePicker();

                          image = await _picker.pickImage(
                              source: ImageSource.gallery);

                          path.value = image.path;
                        }),
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
                                  /* Container(
                                    width: Get.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        File file = File(image.path);

                                        controller.profileImage = file;

                                        path.value = '';
                                      },
                                      child: Text('رفع'),
                                    ),
                                  )*/
                                ],
                              ),
                            );
                    }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
                        width: Get.width,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        child: Center(
                          child: Image.network(
                            snapshot.data['image'],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('البريد الالكترونى'),
                        ),
                        subtitle: Text(
                          snapshot.data['email'],
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('الاسم'),
                        ),
                        subtitle: TextFormField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          validator: (String v) =>
                              v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
                          controller: controller.name,
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('تليفون'),
                        ),
                        subtitle: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (String v) =>
                              v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          controller: controller.phone,
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField(
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: KprimaryColor.withOpacity(.1),
                            labelText: 'اسم المدينة',
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) => v.toString().isNotEmpty
                              ? null
                              : 'مطلوب ادخال قيمة',
                          isExpanded: true,
                          value: int.parse(controller.city.text),
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: cityListItems.map((items) {
                            return DropdownMenuItem(
                              value: items['id'],
                              child: Text(
                                items['name'],
                              ),
                            );
                          }).toList(),
                          onChanged: (val) {
                       
                            controller.city.text = val.toString();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    defaultButton(
                        title: 'حفظ',
                        onPressed: () {
                          if (GetUtils.isNullOrBlank(image)) {
                          } else {
                            File file = File(image.path);
                            controller.profileImage = file;
                          }

                          controller.editProfileMerchant();
                        }),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: KprimaryColor,
              ));
            }
          }),
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
}
