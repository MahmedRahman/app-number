import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

import '../../../data/component.dart';

class CartView extends GetView<CartController> {
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    print(cartProducts);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 0),
      child: listCart(),
    ));
  }

  listCart() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: cartProducts.length == 0
            ? Center(child: Text('لا يوجد منتجات فى السلة'))
            : Obx(() {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: List.generate(
                            cartProducts.length,
                            (index) => itemProduct(
                                image:
                                    cartProducts.elementAt(index).productsImage,
                                price:
                                    cartProducts.elementAt(index).productsPrice,
                                title:
                                    cartProducts.elementAt(index).productsName,
                                productId:
                                    cartProducts.elementAt(index).productsid,
                                qty: cartProducts.elementAt(index).qty,
                                index: index)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 15),
                        child: defaultButton(
                            title: 'متابعة',
                            onPressed: () {
                              if (cartProducts.length == 0) {
                                Fluttertoast.showToast(msg: 'لا يوجد منتجات فى السلة');
                              } else {
                                if (isLogin.value) {
                                  Get.toNamed(Routes.CART_ADDRESS);
                                } else {
                                  Get.toNamed(Routes.SIGNIN);
                                }
                              }
                            }),
                      )
                    ],
                  ),
                );
              }),
      );
}

itemProduct(
        {@required image,
        @required title,
        @required price,
        @required qty,
        @required productId,
        @required index}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.PRODUCT, arguments: [productId.toString()]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Image.network(image),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Text('عدد القطع '), Text(qty.toString())],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${price.toString()} ريال',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: KprimaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          cartProducts.removeAt(index);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              /* Stack(
                  
                  alignment: Alignment.topLeft,
                  children: [
                  
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: KprimaryColor.withOpacity(.3),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: KprimaryColor,
                            ),
                            onPressed: () {}),
                      ),
                    )
                  ],
                ),*/
            ],
          ),
        ),
      ),
    );
