import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/product_model.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

Color KprimaryColor = Color(0xff88206B);
Color KsecondaryColor = Colors.white;
Color KFontColor = Colors.white;
//Color KprimaryGradientColor =Color(0xffCC1569);
String Appname = 'Number 1';
var isLogin = false.obs;

var KTax = 0.obs;
var Kshipping = 0.obs;
var Kdiscount = 0.obs;
var KcartToalProduct = ''.obs;

var KcartToal = ''.obs;
var KcartQty = ''.obs;
var selectScreen = 2.obs;
var Kselectaddress = 0.obs;
var userData;
bool issplash = false;
List<Product> ProductList = [];

List categoriesItems = [];

List<productItem> cartProducts = List<productItem>.empty(growable: true).obs;

class cartItem {
  var addressid;
  var paymentmethod;
  List<productItem> products;
  cartItem({this.addressid, this.paymentmethod, this.products});
}

class productItem {
  var productsid;
  var productsName;
  var productsImage;
  double productsPrice;
  int qty;
  var detail;
  var reciving;

  productItem({
    @required this.productsid,
    @required this.productsName,
    @required this.productsImage,
    @required this.productsPrice,
    @required this.qty,
    this.detail = 0,
    this.reciving = 0,
  });
}

addCard({@required product_id, @required quantity}) async {
  if (isLogin.value) {
    await WebServices()
        .addCart(product_id: product_id, quantity: quantity)
        .then((value) {
      Response response = value.data;
      if (response.body['status']) {
        Fluttertoast.showToast(msg: 'تم الاضافة الى السلة');
      } else {
        Fluttertoast.showToast(msg: 'هذا المنتج موجود فى السلة');
      }
    });
  } else {
    Get.toNamed(Routes.SIGNIN);
  }
}

addwishlist({@required productid}) async {
  if (isLogin.value) {
    await WebServices().addWishlist(productid: productid).then((value) {
      Response response = value.data;
      print(response.bodyString);
      if (response.body['status']) {
        Get.snackbar(Appname, 'تم الاضافة الى المضلة');
      } else {
        Get.snackbar(Appname, 'هذا المنتج موجود فى المضلة');
      }
    });
  } else {
    Get.toNamed(Routes.SIGNIN);
  }
}

ResponsModel categoriesReponse;

Future getCategories() async {
  if (categoriesReponse == null) {
    categoriesReponse = await WebServices().getCategories();
  }
  if (categoriesReponse.success) {
    Response response = categoriesReponse.data;
    return response.body['data'];
  }

  return Future.error('خطاء');
}
