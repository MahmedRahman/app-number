import 'package:app_number/app/data/component.dart';
import 'package:app_number/app/data/data.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductView'),
        centerTitle: true,
      ),
      body: ListView(
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
          ListTile(
            title: Text('جاكيت ازرق'),
            trailing: Text('جنية 230'),
          ),
          ListTile(
            title: Text('الوصف'),
            subtitle: Text(
                'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور ءبلملعةنبو أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا .  أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أيا كوممودو كونسيكيوات .'),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text('  اطلب خدمة التفصيل '),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text('  استلم من المعرض '),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text('  اضف الى السلة '),
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
}
