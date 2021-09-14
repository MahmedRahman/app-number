import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  var FutureList = Future.value().obs;

  Future getWishlist() async {
    ResponsModel userWishlist = await WebServices().getWishlist();

    if (userWishlist.success) {
      Response response = userWishlist.data;

      if (response.body['status']) {
        FutureList.value = Future.value(response.body);

        return response.body;
      }
    }
    return Future.error('خطاء');
  }

  Future deleteWishlist({productid}) async {
    ResponsModel userWishlist =
        await WebServices().deleteWishlist(productid: productid);

    if (userWishlist.success) {
      Response response = userWishlist.data;
      if (response.body['status']) {
        Fluttertoast.showToast(msg: 'تم الحذف');

        getWishlist();
      } else {
        Fluttertoast.showToast(msg: 'خطاء');
      }
    }

    return Future.error('خطاء');
  }
}
