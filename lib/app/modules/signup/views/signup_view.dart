import 'dart:io';

import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  var usertype = 0.obs;
  var data;
  var path = ''.obs;

  var image;

  SignupController controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    data = Get.arguments;
    usertype.value = GetUtils.isNullOrBlank(data) ? 0 : data[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('حساب جديد'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/number.png',
              color: KprimaryColor,
              height: 200,
            ),
               SizedBox(
              height: 20,
            ),
            defualtUploadImage(
                image: 'images/add_photo.png',
                text: 'اضف صورة مرئية',
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  image = await _picker.pickImage(source: ImageSource.gallery);
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
            SizedBox(
              height: 20,
            ),
            defaultTextFormField(
              hintText: 'الاسم',
              controller: controller.name,
            ),
            SizedBox(
              height: 20,
            ),
            defaultTextFormField(
              hintText: 'البريد الالكترونى',
              controller: controller.email,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20,
            ),
            defaultTextFormField(
              hintText: 'الهاتف',
              controller: controller.mobile,
              textInputType: TextInputType.phone,
            ),
            SizedBox(
              height: 10,
            ),
            defaultTextFormField(
              hintText: 'كلمة المرور',
              controller: controller.password,
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 60,
              minWidth: double.infinity,
              color: KprimaryColor,
              onPressed: () {
                File file = File(image.path);

                controller.ProfileImage = file;

                if (usertype.value == 0) {
                  controller.signup();
                } else {
                  controller.merchantSignup();
                }
              },
              child: Text(
                'انشاء حساب',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                child: Text(
                  'لديك حساب',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Get.toNamed(Routes.SIGNIN);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
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
