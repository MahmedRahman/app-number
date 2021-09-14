import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CartInvoiceController extends GetxController {
  //TODO: Implement CartInvoiceController

  final count = 0.obs;
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
  void increment() => count.value++;

  Future getTax() {
    WebServices().getTax().then(
      (value) {
        Response response = value.data;

        if (response.body['status']) {
          KTax.value = response.body['data']['discount'];
        }

        return true;
      },
    );
  }

  Function createOrders() {
    var products = cartProducts
        .fold(
            '',
            (previousValue, element) => previousValue =
                previousValue + element.productsid.toString() + ',')
        .toString()
        .replaceAll(RegExp(r'.$'), "");

    var qty = cartProducts
        .fold(
            '',
            (previousValue, element) =>
                previousValue = previousValue + element.qty.toString() + ',')
        .toString()
        .replaceAll(RegExp(r'.$'), "");

    var detail = cartProducts
        .fold(
            '',
            (previousValue, element) =>
                previousValue = previousValue + element.detail.toString() + ',')
        .toString()
        .replaceAll(RegExp(r'.$'), "");

    var reciving = cartProducts
        .fold(
            '',
            (previousValue, element) => previousValue =
                previousValue + element.reciving.toString() + ',')
        .toString()
        .replaceAll(RegExp(r'.$'), "");

    WebServices()
        .createOrders(
            address_id: Kselectaddress.value,
            products: products,
            qty: qty,
            detail: detail,
            reciving: reciving)
        .then((value) {
      Response response = value.data;

      if (response.body['status']) {

print(response.bodyString);



        Get.snackbar(Appname, 'تم تنفيذ الطلب',
            snackbarStatus: (snackbarStatus) {
          if (snackbarStatus == SnackbarStatus.CLOSED) {
            cartProducts.clear();
            Get.toNamed(Routes.LAYOUT);

          }
        });
      } else {
        Get.snackbar(Appname, 'خطاء');
      }
    });
  }
}
