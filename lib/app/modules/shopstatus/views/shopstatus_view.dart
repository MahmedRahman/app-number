import 'package:app_number/app/data/app_const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/shopstatus_controller.dart';

class ShopstatusView extends GetView<ShopstatusController> {
  @override
  Widget build(BuildContext context) {
 
 
    return Scaffold(
      backgroundColor: KprimaryColor,
      body: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          
              Container(
                color: KprimaryColor,
                child: Row(
                  children: [
           
                
                    IconButton(
                        icon: Icon(Icons.close,color: Colors.white,size: 32,),
                        onPressed: () {
                          Get.back();
                        })
                  ],
                ),
              ),
              SizedBox(
                    height: 20,
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
                        width: 1.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        FontAwesomeIcons.shoppingBag,
                        color: KprimaryColor,
                      ),
                      radius: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'سلسلة محلات الدلتا ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: KprimaryColor),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'منذ 12 س',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              
              
              
               SizedBox(
                    height: 20,
                  ),
             Container(
               height: 2,
               color: KprimaryColor,
             ),
          
              Expanded(
                child: PageView(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.red,
                      child: Image.asset(
                        'images/bg_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                         Container(
                      width: double.infinity,
                      color: Colors.red,
                      child: Image.asset(
                        'images/bg_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
             
            
            ],
          ),
        ),
      ),
   
   
    );
 
 
  }
}
