import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/data/app_const.dart';
import 'app/routes/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(

    SystemUiOverlayStyle(statusBarColor: KprimaryColor,

    systemNavigationBarColor: KprimaryColor
    ),



    
  );

  runApp(
    GetMaterialApp(
      textDirection: TextDirection.rtl,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
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
