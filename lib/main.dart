import 'package:app_number/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/app_const.dart';
import 'app/routes/app_pages.dart';

void main() async {
 cartProducts = List<productItem>.empty(growable: true).obs;
  await GetStorage.init();
  await initServices();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: KprimaryColor,
      systemNavigationBarColor: KprimaryColor,
    ),
  );

  runApp(
    GetMaterialApp(
      textDirection: TextDirection.rtl,
      title: "Number One",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffF3F3F3),
        primaryColor: KprimaryColor,
        accentColor: KsecondaryColor,
        splashColor: Colors.black,
        fontFamily: 'Tajawal',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(KprimaryColor),
            minimumSize: MaterialStateProperty.all(
              Size(60, 55),
            ),
          ),
        ),
      ),
    ),
  );
}

initServices() async {
  await Get.putAsync<UserAuth>(() async => await UserAuth());
}
