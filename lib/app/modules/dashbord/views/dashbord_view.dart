import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/merchant_bord/views/merchant_bord_view.dart';
import 'package:app_number/app/modules/merchant_home/views/merchant_home_view.dart';
import 'package:app_number/app/modules/merchant_order/views/merchant_order_view.dart';
import 'package:app_number/app/modules/merchant_product/views/merchant_product_view.dart';
import 'package:app_number/app/modules/merchant_profile/views/merchant_profile_view.dart';
import 'package:app_number/app/modules/notifaction/views/notifaction_view.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/dashbord_controller.dart';

class DashbordView extends GetView<DashbordController> {
  GlobalKey<SliderMenuContainerState> _key =
      new GlobalKey<SliderMenuContainerState>();

  List<Widget> screen = [
    MerchantBordView(),
    MerchantProductView(),
    MerchantHomeView(),
    MerchantOrderView(),
    MerchantProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: SliderMenuContainer(
            appBarColor: KprimaryColor,
            slideDirection: SlideDirection.RIGHT_TO_LEFT,
            isDraggable: false,
            hasAppBar: false,
            key: _key,
            sliderMenu: Container(
              color: KprimaryColor,
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: KprimaryColor.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: KprimaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Number1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          userData['name'],
                          style: TextStyle(
                            color: KprimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                          },
                          title: 'الـرئيسية',
                          icons: FontAwesomeIcons.phoneSquareAlt,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            Get.toNamed(Routes.MERCHANT_ADD_COUPON);
                          },
                          title: 'كوبونات الخصم',
                          icons: FontAwesomeIcons.phoneSquareAlt,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            Get.toNamed(Routes.MERCHANT_ADD_STATUS);
                          },
                          title: 'الحالات',
                          icons: FontAwesomeIcons.phoneSquareAlt,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            Get.toNamed(Routes.MERCHANT_CONTEST);
                          },
                          title: 'المسابقات',
                          icons: FontAwesomeIcons.phoneSquareAlt,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            Get.toNamed(Routes.CALLUS);
                          },
                          title: 'تواصل معانا',
                          icons: FontAwesomeIcons.phoneSquareAlt,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            Get.toNamed(Routes.ABOUT);
                          },
                          title: 'من نحن',
                          icons: FontAwesomeIcons.solidQuestionCircle,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            Get.toNamed(Routes.TREMS);
                          },
                          title: 'سياسة ارجاع السلع',
                          icons: FontAwesomeIcons.infoCircle,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            Get.toNamed(Routes.TREMS);
                          },
                          title: 'الشروط و الاحكام',
                          icons: FontAwesomeIcons.infoCircle,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            selectScreen.value = 2;
                            Get.offAndToNamed(Routes.SPLASH);
                            //Get.toNamed(Routes.TREMS);
                          },
                          title: 'تسجيل الخروج',
                          icons: FontAwesomeIcons.signOutAlt,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            sliderMain: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: Container(
                  height: 70,
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
                              icon: SvgPicture.asset('images/menu.svg'),
                              onPressed: () {
                                _key.currentState.toggle();
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
              ),
              body: Obx(() {
                return screen[selectScreen.value];
              }),
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: KsecondaryColor,
                buttonBackgroundColor: KprimaryColor,
                index: selectScreen.value,
                height: 60,
                color: KprimaryColor,
                items: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: KsecondaryColor,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('images/menu_home_2.png')),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/menu_home_1.png')),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/menu_home_3.png')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.solidUserCircle,
                      color: KsecondaryColor,
                    ),
                  ),
                ],
                onTap: (index) {
                  selectScreen.value = index;
                  //Handle button tap
                },
              ),
            ),
          ),
        );
      }),
    );
  }

  defaultbntListTile(
          {@required Function onTap,
          @required String title,
          @required IconData icons}) =>
      ListTile(
        onTap: onTap,
        focusColor: Colors.white,
        hoverColor: Colors.red,
        dense: true,
        leading: Icon(
          icons,
          color: Colors.white,
          size: 25,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      );
}
