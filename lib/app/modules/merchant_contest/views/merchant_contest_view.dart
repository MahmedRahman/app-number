import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/merchant_contest_controller.dart';

class MerchantContestView extends GetView<MerchantContestController> {
  MerchantContestController controller = Get.put(MerchantContestController());

  @override
  Widget build(BuildContext context) {
    controller.getQuizMerchant();

    return Scaffold(
      appBar: AppBar(
        title: Text('مسابقات'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.MERCHANT_ADD_CONTEST);
        },
      ),
      body: Obx(() {
        return FutureBuilder(
          future: controller.FutureQuizList.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data.length == 0
                  ? Center(
                      child: Container(
                        child: Text(
                          'لا يوجد مسابقات',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: List.generate(
                          snapshot.data.length,
                          (index) => Card(
                            child: ListTile(
                              title: Text(snapshot.data[index]['text']),
                              subtitle: Text(snapshot.data[index]['prize']),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  controller.deleteQuizMerchant(
                                      quizId: snapshot.data[index]['id']);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      }),
    );
  }
}
