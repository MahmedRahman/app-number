import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:app_number/app/modules/department/detail/views/product_list.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/department_detail_controller.dart';

class DepartmentDetailView extends GetView<DepartmentDetailController> {
  DepartmentDetailController controller = Get.put(DepartmentDetailController());
  @override
  Widget build(BuildContext context) {
    controller.getCategorieProducts(
      CategorieProductsid: Get.arguments[0],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('الاقسام'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: button(
                  image: 'images/depart01.svg',
                  title: 'جديد',
                  onTap: () {
                    Get.to(
                      ProductViewList(),
                      fullscreenDialog: true,
                      arguments: [controller.newest],
                    );
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: button(
                  image: 'images/depart02.svg',
                  title: 'الأكثر ',
                  onTap: () {
                         Get.to(
                      ProductViewList(),
                      fullscreenDialog: true,
                      arguments: [controller.most_selling],
                    );
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: button(
                  image: 'images/depart03.svg',
                  title: 'تصفيات',
                  onTap: () {
                         Get.to(
                      ProductViewList(),
                      fullscreenDialog: true,
                      arguments: [controller.offers],
                    );
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          defualtTitle(
            title: 'الاقسام الفرعية',
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: controller.getCategorieProducts(
                CategorieProductsid: Get.arguments[0],
              ),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? snapshot.data['subs'].length == 0
                        ? Container(
                            child: Text('لا اقسام فرعية'),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                snapshot.data['subs'].length,
                                (index) => Column(
                                  children: [
                                    box(
                                      image: snapshot.data['subs'][index]
                                          ['image'],
                                      title: snapshot.data['subs'][index]
                                          ['name'],
                                      onclick: () {
                                        Get.offAndToNamed(
                                          Routes.DEPARTMENT_DETAIL,
                                          arguments: [
                                            snapshot.data['subs'][index]['id']
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                    : Container(
                        child: Text('جارى التحميل'),
                      );
              }),
          SizedBox(
            height: 20,
          ),
          defualtTitle(
            title: 'تجار القسم',
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: controller.getCategorieProducts(
                CategorieProductsid: Get.arguments[0],
              ),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? snapshot.data['merchants'].length == 0
                        ? Container(
                            child: Text('لا يوجد تجار'),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                snapshot.data['merchants'].length,
                                (index) => Column(
                                  children: [
                                    box(
                                      image: snapshot.data['merchants'][index]
                                          ['logo'],
                                      title: snapshot.data['merchants'][index]
                                          ['name'],
                                      onclick: () {
                                        Get.toNamed(
                                          Routes.TRADER,
                                          arguments: [
                                            snapshot.data['merchants'][index]
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                    : Container(
                        child: Text('جارى التحميل'),
                      );
              }),
          SizedBox(
            height: 20,
          ),
          defualtTitle(
            title: 'المنتجات',
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: controller.getCategorieProducts(
                  CategorieProductsid: Get.arguments[0]),
              builder: (context, snapshot) {
                print(snapshot.data);
                return snapshot.hasData
                    ? snapshot.data['newest'].length == 0
                        ? Container(
                            child: Text('لا يوجد منتجات'),
                          )
                        : Column(
                            children: List.generate(
                              snapshot.data['newest'].length,
                              (index) => itemProduct(
                                image: snapshot.data['newest'][index]['cover'],
                                price: snapshot.data['newest'][index]['price']
                                    .toString(),
                                title: snapshot.data['newest'][index]['name'],
                                traderName: '',
                                productId: snapshot.data['newest'][index]['id'],
                              ),
                            ),
                          )
                    : Container(
                        child: Text('جارى التحميل'),
                      );
              }),
        ],
      ),
    );
  }

  Widget button({
    @required String image,
    @required String title,
    Function onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            border: Border.all(
              width: 1.5,
              color: KprimaryColor,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              children: [
                Container(
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: SvgPicture.asset(image),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      );
}
