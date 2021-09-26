import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
            ),
    );
  }

  quizCard({@required data}) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
            Text(
              ' عنوان المسابقة ${data['text']}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
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
            InkWell(
                onTap: () async {
                  var _url = data['prize'];
                  await canLaunch(_url)
                      ? await launch(_url)
                      : throw 'Could not launch $_url';
                },
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'أضغط هنا',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${data['prize']}',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      );
}
