import 'package:app_number/app/api/web_serives.dart';
import 'package:app_number/app/data/CustomImageCached.dart';
import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/notifaction/views/notifaction_view.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Widget defualtTitle({
  @required String title,
  String textButtontitle = '',
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffAE1D6D),
                    Color(0xffCC1569),
                  ],
                ),
                color: KprimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  textButtontitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: KprimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

itemProduct(
        {@required image,
        @required title,
        @required price,
        @required traderName,
        @required productId}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.PRODUCT, arguments: [productId.toString()]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Image.network(image),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$price ريال',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: KprimaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Text('التاجر'), Text(traderName)],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: MaterialButton(
                          elevation: 0,
                          color: KprimaryColor.withOpacity(.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          onPressed: () {
                            // addCard(product_id: productId, quantity: 1);

                            cartProducts.add(new productItem(
                              productsid: productId,
                              productsName: title,
                              productsPrice: price,
                              productsImage: image,
                              qty: 1,
                            ));
                            Fluttertoast.showToast(msg: 'تم الاضافة الى السلة');
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اضف الى السلة',
                                style: TextStyle(
                                  color: KprimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /* Stack(
                  
                  alignment: Alignment.topLeft,
                  children: [
                  
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: KprimaryColor.withOpacity(.3),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: KprimaryColor,
                            ),
                            onPressed: () {}),
                      ),
                    )
                  ],
                ),*/
            ],
          ),
        ),
      ),
    );

Widget box({
  @required String image,
  String title = '',
  Function onclick,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          border: Border.all(
            width: 2,
            color: KprimaryColor,
          ),
        ),
        child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          splashColor: KprimaryColor.withOpacity(.5),
          color: Colors.white,
          onPressed: onclick,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CustomImageCached(imageUrl: image),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

Widget boxCircle({
  @required String image,
  Function onclick,
}) =>
    InkWell(
      onTap: onclick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: KprimaryColor, width: 2),
          ),
          child: ClipOval(
            child: SizedBox(
              child: CustomImageCached(imageUrl: image),
              width: 80,
              height: 80,
            ),
          ),
        ),
      ),
    );

Widget boxCircleTitle({
  @required String title,
  Function onclick,
}) =>
    InkWell(
      onTap: onclick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: KprimaryColor, width: 2),
          ),
          child: SizedBox(
              child: Center(child: Text(title)), width: 80, height: 80),
        ),
      ),
    );

Widget boxTitle({
  @required String image,
  @required String title,
  Function onclick,
}) =>
    InkWell(
      onTap: onclick,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      //bottomRight: Radius.circular(18),
                      topLeft: Radius.circular(18),
                    ),
                    //borderRadius: BorderRadius.circular(50),
                  ),
                  child: FittedBox(
                    child: CustomImageCached(
                      imageUrl: image,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Divider(
                height: 2,
                thickness: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: KprimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget productBox({
  @required String image,
  @required String title,
  @required String price,
  @required String productid,
  @required traderName = '',
  Function onClick,
}) =>
    InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        price.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: KprimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'ريال',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: KprimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'التاجر',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(traderName)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    elevation: 0,
                    color: KprimaryColor.withOpacity(.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () async {
                      cartProducts.add(new productItem(
                        productsid: productid,
                        productsName: title,
                        productsPrice: double.parse(price) ,
                        productsImage: image,
                        qty: 1,
                      ));
                      Fluttertoast.showToast(msg: 'تم الاضافة الى السلة');

                      //addCard(product_id: productid, quantity: '1');
                    },
                    child: Text(
                      'اضف الى السلة',
                      style: TextStyle(
                        color: KprimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
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
                  child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: KprimaryColor,
                      ),
                      onPressed: () {
                        addwishlist(productid: productid);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget customAppBar({Function onMenuClick}) => PreferredSize(
      preferredSize: Size.fromHeight(90),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          overflow: Overflow.visible,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: SvgPicture.asset('images/notifaction.svg'),
                    onPressed: () {
                      Get.to(
                        NotifactionView(),
                        fullscreenDialog: true,
                      );
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset('images/notifaction.svg'),
                    onPressed: () {
                      Get.to(
                        NotifactionView(),
                        fullscreenDialog: true,
                      );
                    },
                  )
                ],
              ),
            ),
            Positioned(
              bottom: -30,
              child: Container(
                width: Get.width * .7,
                height: 60,
                color: Colors.transparent,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(50),
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        'images/preferences_icon.svg',
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        'images/serech_icon.svg',
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

defualtUploadImage({@required onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: KprimaryColor),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/add_photo.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'اضف صورة او فيديو',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}

defaultButton({@required String title, @required Function onPressed}) =>
    SizedBox(
      width: Get.width,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );

defaultTextFormField(
        {@required hintText,
        @required controller,
        TextInputType textInputType = TextInputType.name,
        Function validator,
        bool obscureText = false}) =>
    TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: KprimaryColor.withOpacity(.2),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KprimaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KprimaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: KprimaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
    );

defaultDropdownButtonField({
  String labelText,
  Function onChanged(dynamic value),
}) {
  return DropdownButtonFormField(
    decoration: new InputDecoration(
      filled: true,
      fillColor: KprimaryColor.withOpacity(.1),
      labelText: labelText,
      border: OutlineInputBorder(),
    ),
    isExpanded: true,
    value: 1,
    icon: Icon(Icons.keyboard_arrow_down),
    items: categoriesItems.map((items) {
      return DropdownMenuItem(value: items['id'], child: Text(items['name']));
    }).toList(),
    //onChanged: onChanged(val),
  );
}
