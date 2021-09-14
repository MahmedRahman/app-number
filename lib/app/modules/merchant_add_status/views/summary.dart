import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/merchant_add_status/controllers/merchant_add_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class summary_view extends GetView<MerchantAddStatusController> {
  MerchantAddStatusController controller =
      Get.put(MerchantAddStatusController());

  @override
  Widget build(BuildContext context) {
    controller.getStatusMerchant();
    return Scaffold(
      appBar: AppBar(
        title: Text('الموجز'),
        centerTitle: true,
      ),
      body: Obx(() {
        return FutureBuilder(
            future: controller.FutureStatusList.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.length == 0
                    ? Center(
                        child: Container(
                          child: Text(
                            'لا يوجود موجز',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    : Container(
                        height: 800,
                        child: GridView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: Get.width / 2,
                                child: Card(
                                  child: Column(
                                    children: [
                                      snapshot.data[index]['image'] == ""
                                          ? Expanded(
                                              child: Container(
                                                width: Get.width,
                                                color: Colors.black,
                                                child: Center(
                                                  child: Text(
                                                    GetUtils.isNull(
                                                            snapshot.data[index]
                                                                ['text'])
                                                        ? ''
                                                        : snapshot.data[index]
                                                            ['text'],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Expanded(
                                              child: Container(
                                                width: Get.width,
                                                color: Colors.black,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.network(
                                                    snapshot.data[index]
                                                        ['image'],
                                                  ),
                                                ),
                                              ),
                                            ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: GetUtils.isNullOrBlank(snapshot
                                                    .data[index]['image'])
                                                ? Icon(
                                                    Icons.text_fields,
                                                    color: KprimaryColor,
                                                  )
                                                : Icon(
                                                    Icons.photo,
                                                    color: KprimaryColor,
                                                  ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: KprimaryColor,
                                            ),
                                            onPressed: () {
                                              controller.deleteStatusMerchant(
                                                statusId: snapshot.data[index]
                                                    ['id'],
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                        ),
                      );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: KprimaryColor,
                ));
              }
            });
      }),
    );
  }
}
