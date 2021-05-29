import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل المنتج'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                color: Colors.red,
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'images/product_img.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(
                      FontAwesomeIcons.heart,
                      color: KprimaryColor,
                    ),
                  ),
                ),
              )
            ],
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
          ListTile(
            title: Text(
              'جاكيت ازرق',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              'جنية 230',
              style: TextStyle(
                color: KprimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'الوصف',
              style: TextStyle(
                color: KprimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
                'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور ءبلملعةنبو أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا .  أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أيا كوممودو كونسيكيوات .'),
          ),
          SizedBox(
            height: 10,
          ),
          bnt(title: '  اطلب خدمة التفصيل '),
          SizedBox(
            height: 10,
          ),
          bnt(title: '  استلم من المعرض '),
          SizedBox(
            height: 10,
          ),
          bnt(title: '  اضف الى السلة '),
          SizedBox(
            height: 10,
          ),
          defualtTitle(title: 'احدث المنتجات'),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                10,
                (index) => productBox(
                    image: productImage.elementAt(1),
                    onClick: () {
                      Get.toNamed(Routes.PRODUCT);
                    }),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget bnt({
    @required String title,

  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 0,
          height: 60,
          color: KprimaryColor.withOpacity(.1),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: KprimaryColor),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                FontAwesomeIcons.shoppingBag,
                color: KprimaryColor,
              )
            ],
          ),
        ),
      );
}
