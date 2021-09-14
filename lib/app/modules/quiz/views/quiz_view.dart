import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  var data;

  @override
  Widget build(BuildContext context) {
    data = Get.arguments;

    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text('مسابقات'),
        centerTitle: true,
      ),
      body: data.length == 0
          ? Center(
              child: Container(
                child: Text(
                  'لا يوجد مسابقات',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  defualtTitle(title: 'مسابقات'),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: PageView(
                        children: List.generate(
                      data.length,
                      (index) => data.length == 0
                          ? Container(
                              child: Text('لا يوجود مسابقات'),
                            )
                          : quizCard(data: data[index]),
                    )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
    );
  }

  quizCard({@required data}) => Container(
    
    child: Column(
          children: [
       
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.black,
                child: CustomImageCached(
                  imageUrl: data['image'],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text('سؤال المسابقة' , style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
              height: 10,
            ),
            Text(
              '${data['text']}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                initialValue: data['prize'],
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
  );
}
