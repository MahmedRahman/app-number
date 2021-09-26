import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //controller.city.text = '1';

    return Scaffold(
      appBar: AppBar(
        title: Text('الملف الشخصى'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.keyboard),
              onPressed: () {
                Get.defaultDialog(
                  title: 'تغير كلمة السر',
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
                      controller: controller.newPassword,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultButton(
                        title: 'حفظ',
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          controller.profileChangePassword();
                        })
                  ],
                ));
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: controller.getProfile(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Form(
                  key: _formKey,
                  child: ListView(
                    children: [
           
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
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              validator: (String v) =>
                                  v.isNotEmpty ? null : 'مطلوب ادخال قيمة',
                              controller: controller.name,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('تليفون'),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
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
                      ),

                      
    
                      SizedBox(
                        height: 10,
                      ),
                      defaultButton(
                          title: 'حفظ',
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState.validate()) {
                              controller.editProfile();
                            }
                          })
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
      ),
    );
  }
}
