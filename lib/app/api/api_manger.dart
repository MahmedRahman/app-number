import 'dart:convert';

import 'package:app_number/app/api/response_model.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:app_number/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

String baesUrl = 'https://dev.matrixclouds.com/number-one/api/';
String apiKey = 'zoe_api_key';
String language = 'ar';

final header = {
  'x-api-key': apiKey,
  'Content-Language': language,
  'Authorization': 'Bearer ',
};

class APIManger extends GetConnect {
  authorization() {
    String tokan = Get.find<UserAuth>().getUserToken();

    if (tokan != null) {
      header.update(
        'Authorization',
        (value) {
          return 'Bearer ' + tokan;
        },
      );
    }
  }

  Future<ResponsModel> repPost(url, body, {bool showLoading = false}) async {
    url = baesUrl + url;

    authorization();

    showLoading
        ? EasyLoading.show(status: 'جارى التحميل ...')
        : SizedBox.shrink();

    print("Api Request Post $url ");

    Response response = await post(
      url,
      body,
      headers: header,
    );

    print(
        "Api Request ${response.request.method} ${response.request.url.toString()} ${response.statusCode.toString()}");

    showLoading ? EasyLoading.dismiss() : SizedBox.shrink();

    return responseAnalyzes(response: response);
  }

  Future<ResponsModel> repGet(url, {bool showLoading = false}) async {
    url = baesUrl + url;

    authorization();

    showLoading ? EasyLoading.show(status: 'جارى التحميل') : SizedBox.shrink();

    print("Api Request Get " + url);

    Response response = await get(
      url,
      headers: header,
    );

    print(
        "Api Request ${response.request.method} ${response.request.url.toString()} ${response.statusCode.toString()}");

    showLoading ? EasyLoading.dismiss() : SizedBox.shrink();

    return responseAnalyzes(response: response);
  }

  ResponsModel responseAnalyzes({Response response}) {
    switch (response.statusCode) {
      case 200:
        return ResponsModel(
          code: response.statusCode,
          success: true,
          data: response,
        );
        break;
      case 401:
        Get.toNamed(Routes.SIGNIN);
        return ResponsModel(
          code: 666,
          success: false,
        );
        break;
      default:
        Get.to(ErrorView(response: response));
        return ResponsModel(
          code: response.statusCode,
          success: false,
        );
    }
  }
}

class ErrorView extends GetView {
  ErrorView({
    this.response,
  });

  final Response response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text('API Url'),
                subtitle: Text(response.request.url.toString()),
              ),
              ListTile(
                title: Text('Request Type'),
                subtitle: Text(response.request.method),
              ),
              ListTile(
                title: Text('API Status Code'),
                subtitle: Text(response.statusCode.toString()),
              ),
              ListTile(
                title: Text('API Response'),
                subtitle: Text(response.bodyString),
              ),
              ListTile(
                title: Text('API Body'),
                subtitle: Text(response.request.toString()),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Try Again',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
