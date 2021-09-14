import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/merchant_add_contest_controller.dart';
import 'package:app_number/app/data/component.dart';

class MerchantAddContestView extends GetView<MerchantAddContestController> {
  MerchantAddContestController controller =
      Get.put(MerchantAddContestController());

  var imagepath = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضف مسابقة'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              defualtUploadImage(onTap: () async {
                final ImagePicker _picker = ImagePicker();
                XFile image =
                    await _picker.pickImage(source: ImageSource.gallery);
                imagepath.value = image.path;

                controller.imageFile = File(image.path);
              }),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return imagepath.value == ''
                    ? Container()
                    : Container(
                        width: Get.width,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            height: 250,
                            child: Image.file(
                              File(imagepath.value),
                            ),
                          ),
                        ),
                      );
              }),
              SizedBox(
                height: 20,
              ),
              defaultTextFormField(
                controller: controller.Quize,
                hintText: 'أسم المسابقة',
              ),
              SizedBox(
                height: 10,
              ),
              /*
              defaultTextFormField(
                controller: controller.answer1,
                hintText: 'الاجابة الاولى',
              ),
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                controller: controller.answer2,
                hintText: 'الاجابة الثانية',
              ),
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                controller: controller.answer3,
                hintText: 'الاجابة الثالثة',
              ),
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                controller: controller.correctAnswer,
                hintText: 'الاجابة الصحيحة',
              ),
            */
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                controller: controller.prize,
                hintText: 'أضف لينك',
              ),
              SizedBox(
                height: 10,
              ),
              defaultButton(
                title: 'أضف',
                onPressed: () {
                  controller.addQuizMerchant();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
