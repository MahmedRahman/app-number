import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/shopstatus_controller.dart';

class ShopstatusView extends GetView<ShopstatusController> {
  var data = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    print(data);

    return Scaffold(
      backgroundColor: KprimaryColor,
      body: 
      
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 80,right: 20,left: 20,bottom: 10),
          child: Container(
            color: Colors.white,
            child: Column(
             
           
              children: [
               
                Container(
                  color: KprimaryColor,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 32,
                              ),
                              onPressed: () {
                                Get.back();
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: KprimaryColor,
                  thickness: 1,
                ),
              
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: new Border.all(
                          color: KprimaryColor,
                          width: 1.5,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: SizedBox(
                          width: 30,
                          child:
                              CustomImageCached(imageUrl: data['merchant_logo']),
                        ),
                        radius: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        data['merchant_name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: KprimaryColor),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      data['created_from'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              
                Divider(),
                Expanded(
                  child: PageView(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: data['image'] == ""
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text(data['text']),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomImageCached(imageUrl: data['image']),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
   
    );
  }
}
