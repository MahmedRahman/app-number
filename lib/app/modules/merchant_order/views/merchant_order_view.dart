import 'dart:ui';

import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../controllers/merchant_order_controller.dart';

class MerchantOrderView extends GetView<MerchantOrderController> {
  MerchantOrderController controller = Get.put(MerchantOrderController());

  @override
  Widget build(BuildContext context) {
    controller.getOrdersMerchant();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            defualtTitle(title: 'طلبات الشراء'),
            Obx(() {
              return FutureBuilder(
                future: controller.OrdersMerchant.value,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

print('xxxxxxxx');
print(snapshot.data.length);

                    return snapshot.data.length == 0
                        ? Container(
                            child: Text('لايوجد طلبات'),
                          )
                        : Column(
                            children: List.generate(
                              snapshot.data.length,
                              (index) =>
                                  defualtOrder(data: snapshot.data[index]),
                            ),
                          );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  defualtOrder({@required data}) {
    //RxBool orderAprroval;
    //orderAprroval.value = data['merchant_approval'].obs;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: KprimaryColor),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50.0),
            topLeft: Radius.circular(50.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' الطلبية : ${data['id'].toString()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    ' السعر : ${data['cart_total'].toString()} ريال',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'العميل : ${data['customer'].toString()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'تاريخ : ${data['date'].toString()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '',
               // 'العنوان : ${data['address']['name'].toString()} ${data['address']['street'].toString()} ${data['address']['building'].toString()} ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'المنتجات',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: KprimaryColor,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                    data['items'].length,
                    (index) => defaultitem(
                          name: data['items'][index]['name'],
                          price: data['items'][index]['price'].toString(),
                          images: data['items'][index]['cover'],
                          quantity: data['items'][index]['quantity'].toString(),
                        )),
              ),
              SizedBox(
                height: 10,
              ),
              data['merchant_approval']
                  ? Container(
                      child: Center(
                          child: Text(
                        'تم قبول الطلب',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    )
                  : defaultButton(
                      title: 'قبول',
                      onPressed: () {
                        data['merchant_approval'] = true;
                        controller.approveOrderMerchant(
                          orderid: data['id'].toString(),
                        );
                      }),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  defaultitem(
          {@required String price,
          @required String name,
          @required String quantity,
          @required String images}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: KprimaryColor),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            ),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: KprimaryColor),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    topLeft: Radius.circular(50.0),
                  ),
                ),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: CustomImageCached(imageUrl: images),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'السعر : $price',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'العدد : $quantity',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
