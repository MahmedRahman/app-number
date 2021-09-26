import 'package:app_number/app/data/app_const.dart';
import 'package:app_number/app/modules/acount/views/acount_view.dart';
import 'package:app_number/app/modules/cart/views/cart_view.dart';
import 'package:app_number/app/modules/checkout/views/checkout_view.dart';
import 'package:app_number/app/modules/department/views/department_view.dart';
import 'package:app_number/app/modules/favourite/views/favourite_view.dart';
import 'package:app_number/app/modules/home/views/home_view.dart';
import 'package:app_number/app/modules/notifaction/views/notifaction_view.dart';
import 'package:app_number/app/modules/trader/views/trader_view.dart';
import 'package:app_number/app/routes/app_pages.dart';
import 'package:app_number/auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/layout_controller.dart';
import 'package:badges/badges.dart';

class LayoutView extends GetView<LayoutController> {
  GlobalKey<SliderMenuContainerState> _key =
      new GlobalKey<SliderMenuContainerState>();

  List<Widget> screen = [
    DepartmentView(),
    FavouriteView(),
    HomeView(),
    CartView(),
    AcountView(),
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
                        isLogin.value
                            ? Text(
                                'Number 1',
                                style: TextStyle(
                                  color: KprimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                'Number 1',
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
                              selectScreen.value = 2;
                            },
                            title: 'الـرئيسية',
                            icons: Icons.home),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            Get.toNamed(Routes.PROFILE);
                          },
                          title: 'الصفحة الشخصية',
                          icons: FontAwesomeIcons.userAlt,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            selectScreen.value = 1;
                          },
                          title: 'قائمة الامنيات',
                          icons: FontAwesomeIcons.solidHeart,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            if (isLogin.value) {
                              selectScreen.value = 3;
                            } else {
                              Get.toNamed(Routes.SIGNIN);
                            }
                          },
                          title: 'سلة المشتريات',
                          icons: FontAwesomeIcons.shoppingCart,
                        ),
                        defaultbntListTile(
                          onTap: () {
                            _key.currentState.toggle();
                            Get.toNamed(Routes.ORDER_BOOK);
                          },
                          title: 'طلباتى',
                          icons: FontAwesomeIcons.shoppingBag,
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
                            selectScreen.value = 2;
                            Get.toNamed(Routes.SIGNIN, arguments: [1, '', '']);
                          },
                          title: 'تسجيل دخول كتاجر',
                          icons: FontAwesomeIcons.signInAlt,
                        ),
                        isLogin.value
                            ? defaultbntListTile(
                                onTap: () {
                                  _key.currentState.toggle();
                                  Get.find<UserAuth>().setUserToken(null);

                                  isLogin.value = false;
                                  Get.toNamed(Routes.SPLASH);
                                },
                                title: 'تسجيل خروج',
                                icons: FontAwesomeIcons.signOutAlt,
                              )
                            : defaultbntListTile(
                                onTap: () {
                                  _key.currentState.toggle();
                                  selectScreen.value = 2;
                                  Get.toNamed(
                                    Routes.SIGNIN,
                                    arguments: [0, '', ''],
                                  );
                                },
                                title: 'تسجيل دخول',
                                icons: FontAwesomeIcons.signInAlt,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: InkWell(
                                onTap: () {
                                  if (isLogin.value) {
                                    selectScreen.value = 3;
                                  } else {
                                    Get.toNamed(Routes.SIGNIN);
                                  }
                                },
                                child: Badge(
                                  badgeColor: Colors.white,
                                  badgeContent: Text(
                                    cartProducts.length.toString(),
                                    style: TextStyle(
                                      color: KprimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.shopping_bag,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
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
                            controller: controller.serechText,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(50),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: IconButton(
                                icon: SvgPicture.asset(
                                  'images/preferences_icon.svg',
                                ),
                                onPressed: () {
                                  controller.getSearchProduct();
                                  FocusScope.of(context).unfocus();
                                },
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
                backgroundColor: Colors.transparent,
                buttonBackgroundColor: Colors.grey[300],
                index: selectScreen.value,
                height: 60,
                color: Colors.grey[300],
                items: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.archway,
                      color: KprimaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      'images/nounwish.svg',
                      color: KprimaryColor,
                      width: 32,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.home,
                      color: KprimaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.shoppingCart,
                      color: KprimaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.solidUserCircle,
                      color: KprimaryColor,
                    ),
                  ),
                ],
                onTap: (index) {
                  if (isLogin.value || index == 0 || index == 2 || index == 3) {
                    selectScreen.value = index;
                  } else {
                    Get.toNamed(Routes.SIGNIN);
                  }
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
