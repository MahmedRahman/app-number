import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/acount/views/acount_view.dart';
import 'package:app_number/app/modules/checkout/views/checkout_view.dart';
import 'package:app_number/app/modules/department/views/department_view.dart';
import 'package:app_number/app/modules/favourite/views/favourite_view.dart';
import 'package:app_number/app/modules/home/views/home_view.dart';
import 'package:app_number/app/modules/notifaction/views/notifaction_view.dart';
import 'package:app_number/app/modules/trader/views/trader_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  GlobalKey<SliderMenuContainerState> _key =
      new GlobalKey<SliderMenuContainerState>();

  List<Widget> screen = [
     DepartmentView(),
    FavouriteView(),
   
    HomeView(),
    CheckoutView(),
    AcountView(),
  ];

  var selectScreen = 2.obs;

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
                              'M',
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
                          'محمد عبد الرحمن',
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
                        ListTile(
                          onTap: () {},
                          focusColor: Colors.white,
                          hoverColor: Colors.red,
                          dense: true,
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 25,
                          ),
                          title: Text(
                            'الـرئيسية',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            FontAwesomeIcons.userAlt,
                            color: Colors.white,
                            size: 25,
                          ),
                          title: Text(
                            'الصفحة الشخصية',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.white,
                            size: 25,
                          ),
                          title: Text(
                            'المفضلة',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            FontAwesomeIcons.shoppingCart,
                            color: Colors.white,
                            size: 25,
                          ),
                          title: Text(
                            'سلة المشتريات',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            FontAwesomeIcons.shoppingBag,
                            color: Colors.white,
                            size: 25,
                          ),
                          title: Text(
                            'طلباتى',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            FontAwesomeIcons.skyatlas,
                            color: Colors.white,
                            size: 25,
                          ),
                          title: Text(
                            'الاعدادات',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            FontAwesomeIcons.phoneSquareAlt,
                            color: Colors.white,
                            size: 25,
                          ),
                          title: Text(
                            'تواصل معانا',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            FontAwesomeIcons.solidQuestionCircle,
                            color: Colors.white,
                            size: 25,
                          ),
                          title: Text(
                            'من نحن',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            FontAwesomeIcons.infoCircle,
                            color: Colors.white,
                            size: 25,
                          ),
                          title: Text(
                            'سياسة ارجاع السلع',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            FontAwesomeIcons.signOutAlt,
                            color: Colors.white,
                            size: 25,
                          ),
                          title: Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            sliderMain: Scaffold(
              appBar:
              
              
               PreferredSize(
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
              
              
              body: screen[selectScreen.value],
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
                      FontAwesomeIcons.archway,
                      color: KsecondaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      FontAwesomeIcons.heart,
                      color: KsecondaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.home,
                      color: KsecondaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.shoppingCart,
                      color: KsecondaryColor,
                    ),
                  ),
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
}
