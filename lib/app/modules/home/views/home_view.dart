import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app_number/app/modules/department/detail/views/department_detail_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.getCategories();
    return Scaffold(
      body: ListView(
        children: [
          defaultSlider(),
          SizedBox(
            height: 10,
          ),

          defualtTitle(
            title: 'التجار الشائعين',
          ),

          SizedBox(
            height: 10,
          ),

          listMerchant(imageList: imageList),

          SizedBox(
            height: 10,
          ),

          defualtTitle(title: 'احدث الحالات'),

          SizedBox(
            height: 10,
          ),

          //status List
          listStatusBox(),

          SizedBox(
            height: 10,
          ),

          defualtTitle(
            title: 'الاقسام',
          ),

          SizedBox(
            height: 10,
          ),

          listDepartmentBox(controller.getCategories()),

          SizedBox(
            height: 20,
          ),

          defualtTitle(
            title: 'احدث المنتجات',
          ),

          SizedBox(
            height: 20,
          ),

          newProducts(),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  listDepartmentBox(Future<dynamic> future) => FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: List.generate(
                    snapshot.data.length,
                    (index) => boxTitle(
                      image: snapshot.data[index]['image'],
                      title: snapshot.data[index]['name'],
                      onclick: () {
                        Get.toNamed(Routes.DEPARTMENT_DETAIL,
                            arguments: [snapshot.data[index]['id'].toString()]);
                      },
                    ),
                  ),
                )
              : Container(
                  child: Text('لا يوجد اقسام'),
                );
        },
      );

  defaultSlider() => FutureBuilder(
      future: controller.getSlider(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 200,
            child: PageView(
                children: List.generate(snapshot.data.length, (index) {
              print(snapshot.data[index]['image']);
              return Container(
                child: CustomImageCached(
                      imageUrl: snapshot.data[index]['image'],
                    ),
              );
            })),
          );
        }
        return CircularProgressIndicator();
      });

  listMerchant({
    @required imageList,
  }) =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder(
            future: controller.getMerchants(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: List.generate(
                    snapshot.data.length,
                    (index) => box(
                      image: snapshot.data[index]['logo'],
                      title: snapshot.data[index]['name'],
                      onclick: () {
                        Get.toNamed(Routes.TRADER,
                            arguments: [snapshot.data[index]]);
                      },
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      );

  listStatusBox() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder(
            future: controller.getStatuses(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: List.generate(
                    snapshot.data.length,
                    (index) => Column(
                      children: [
                        GetUtils.isNullOrBlank(snapshot.data[index]['image'])
                            ? boxCircleTitle(
                                title: snapshot.data[index]['text'],
                                onclick: () {
                                  Get.toNamed(Routes.SHOPSTATUS,
                                      arguments: [snapshot.data[index]]);
                                },
                              )
                            : boxCircle(
                                image: snapshot.data[index]['image'],
                                onclick: () {
                                  Get.toNamed(Routes.SHOPSTATUS,
                                      arguments: [snapshot.data[index]]);
                                },
                              ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          snapshot.data[index]['merchant_name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: KprimaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      );

  statusBox({@required data}) => Container(
        height: 600,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 80, right: 20, left: 20, bottom: 10),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    color: KprimaryColor,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 32,
                                ),
                                onPressed: () {
                                  Get.back();
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: KprimaryColor,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: KprimaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: SizedBox(
                            width: 30,
                            child: CustomImageCached(
                                imageUrl: data['merchant_logo']),
                          ),
                          radius: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          data['merchant_name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data['created_from'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Divider(),
                  Expanded(
                    child: PageView(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.black,
                          child: data['image'] == ""
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Text(data['text']),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomImageCached(
                                      imageUrl: data['image']),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  newProducts() => FutureBuilder(
      future: controller.newProducts(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    snapshot.data.length,
                    (index) => productBox(
                      image: snapshot.data[index]['cover'],
                      title: snapshot.data[index]['name'],
                      price: snapshot.data[index]['price'].toString(),
                      productid: snapshot.data[index]['id'].toString(),
                      traderName: snapshot.data[index]['merchant']['name'],
                      onClick: () {
                        Get.toNamed(
                          Routes.PRODUCT,
                          arguments: [snapshot.data[index]['id'].toString()],
                        );
                      },
                    ),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: CustomIndicator(
                    indicatorStatus: IndicatorStatus.ListProduct,
                  ),
                ),
              );
      });
}
