import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/department_controller.dart';

class DepartmentView extends GetView<DepartmentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            defualtTitle(
              title: 'الاقسام',
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error);
                  }

                  return snapshot.hasData
                      ? GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          children: List.generate(
                            snapshot.data.length,
                            (index) => boxTitle(
                              image: snapshot.data[index]['image'],
                              title: snapshot.data[index]['name'],
                              onclick: () {
                                Get.toNamed(Routes.DEPARTMENT_DETAIL,
                                    arguments: [
                                      snapshot.data[index]['id'].toString()
                                    ]);
                              },
                            ),
                          ),
                        )
                      : Container(
                          child: Center(child: CustomIndicator()),
                        );
                }),
          ],
        ),
      ),
    );
  }
}
