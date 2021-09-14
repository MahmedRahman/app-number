import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:app_number/app/data/product_model.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  String productid;

  @override
  Widget build(BuildContext context) {
    print(Get.arguments[0]);
    productid = Get.arguments[0];

    var detail = false.obs;
    var reciving = false.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل المنتج'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getProduct(productid: productid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                SizedBox(
                  height: 250,
                  child: snapshot.data['images'].length == 0
                      ? Container()
                      : PageView(
                          children: List.generate(
                            snapshot.data['images'].length,
                            (index) => defaultImage(
                                snapshot.data['images'][index]['image']),
                          ),
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
                defaultProductLabel(snapshot.data['merchant']['name']),
                SizedBox(
                  height: 10,
                ),
                defaultProductPrice(
                    snapshot.data['name'], snapshot.data['price']),
                SizedBox(
                  height: 10,
                ),
/*
                ListTile(
                  leading: Text(
                    'عدد المنتجات فى المجزن',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(snapshot.data['stock'].toString()),
                ),
                */
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  trailing: SizedBox(
                    width: 60,
                    child: TextFormField(
                      controller: controller.inputQty,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  leading: Text(
                    'الكمية',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultProductDescription(snapshot.data['description'] ?? ''),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return button(
                      title: 'اطلب خدمة التفصيل',
                      onPressed: () {
                        detail.value = !detail.value;
                      },
                      Colortag: detail.value);
                }),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return button(
                      title: 'استلم من المعرض',
                      onPressed: () {
                        reciving.value = !reciving.value;
                      },
                      Colortag: reciving.value);
                }),
                SizedBox(
                  height: 20,
                ),
                button(
                  title: 'اضف الى السلة',
                  onPressed: () {


//print(double.parse(snapshot.data['price'].toString()));

                    cartProducts.add(
                      new productItem(
                        productsid: productid.toString(),
                        productsName: snapshot.data['name'].toString(),
                        productsPrice: double.parse(snapshot.data['price'].toString()) ,
                        productsImage: snapshot.data['cover'],
                        qty:  int.parse(controller.inputQty.text),
                        detail: detail.value ? 0 : 1,
                        reciving: reciving.value ? 0 : 1,
                      ),
                    );
                    Fluttertoast.showToast(msg: 'تم الاضافة الى السلة');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                defualtTitle(title: 'احدث المنتجات'),
                SizedBox(
                  height: 20,
                ),
                newProduct(),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          }

          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
          );
        },
      ),
    );
  }

  Widget button(
          {@required String title,
          Function onPressed,
          bool Colortag = false}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 0,
          height: 60,
          color: Colortag
              ? KprimaryColor.withOpacity(.5)
              : KprimaryColor.withOpacity(.1),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: KprimaryColor),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      );

  defaultImage(image) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            color: Colors.black,
            height: 300,
            width: double.infinity,
            child: Image.network(
              image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Icon(
                  FontAwesomeIcons.heart,
                  color: KprimaryColor,
                ),
              ),
            ),
          )
        ],
      );

  defaultProductLabel(merchantname) => Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: new Border.all(
                color: KprimaryColor,
                width: 1.0,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.shoppingBag,
                color: KprimaryColor,
              ),
              radius: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              merchantname,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: KprimaryColor),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      );

  defaultProductPrice(name, price) => ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          price.toString(),
          style: TextStyle(
            color: KprimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  defaultProductDescription(description) => ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'الوصف',
            style: TextStyle(
              color: KprimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(description),
      );

  newProduct() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            10,
            (index) => productBox(
                image: productImage.elementAt(1),
                price: '0',
                title: '',
                onClick: () {
                  Get.toNamed(Routes.PRODUCT);
                },
                productid: ''),
          ),
        ),
      );
}
