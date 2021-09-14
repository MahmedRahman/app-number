import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/addressBook/controllers/address_book_controller.dart';
import 'package:app_number/app/modules/cart_address/controllers/cart_address_controller.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddressAddController extends GetxController {
  //TODO: Implement AddressAddController

  int city_id = 1;

  TextEditingController name = new TextEditingController();

  TextEditingController area = new TextEditingController();

  TextEditingController street = new TextEditingController();

  TextEditingController building = new TextEditingController();

  TextEditingController apartment = new TextEditingController();

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

  Future addAddresses() {
    WebServices()
        .addAddresses(
      city_id: '1',
      name: name.text,
      area: area.text,
      street: street.text,
      building: building.text,
      apartment: apartment.text,
    )
        .then(
      (value) {
        Response response = value.data;
        if (response.body['status']) {
          Fluttertoast.showToast(
            msg: response.body['message'],
            toastLength: Toast.LENGTH_SHORT,
          );

          CartAddressController controllerCartAddress =
              Get.put(CartAddressController());
          controllerCartAddress.getAddresses();
          AddressBookController controller = Get.put(AddressBookController());
          controller.getAddresses().then((value) => Get.back());

          return true;
        } else {
          Fluttertoast.showToast(
            msg: response.body['message'],
            toastLength: Toast.LENGTH_SHORT,
          );
        }
        return true;
      },
    );
  }
}
