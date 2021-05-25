import 'package:get/get.dart';

import 'package:app_number/app/modules/acount/bindings/acount_binding.dart';
import 'package:app_number/app/modules/acount/views/acount_view.dart';
import 'package:app_number/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:app_number/app/modules/checkout/views/checkout_view.dart';
import 'package:app_number/app/modules/department/bindings/department_binding.dart';
import 'package:app_number/app/modules/department/views/department_view.dart';
import 'package:app_number/app/modules/home/bindings/home_binding.dart';
import 'package:app_number/app/modules/home/views/home_view.dart';
import 'package:app_number/app/modules/layout/bindings/layout_binding.dart';
import 'package:app_number/app/modules/layout/views/layout_view.dart';
import 'package:app_number/app/modules/splash/bindings/splash_binding.dart';
import 'package:app_number/app/modules/splash/views/splash_view.dart';
import 'package:app_number/app/modules/trader/bindings/trader_binding.dart';
import 'package:app_number/app/modules/trader/views/trader_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LAYOUT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LAYOUT,
      page: () => LayoutView(),
      binding: LayoutBinding(),
    ),
    GetPage(
      name: _Paths.ACOUNT,
      page: () => AcountView(),
      binding: AcountBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.DEPARTMENT,
      page: () => DepartmentView(),
      binding: DepartmentBinding(),
    ),
    GetPage(
      name: _Paths.TRADER,
      page: () => TraderView(),
      binding: TraderBinding(),
    ),
  ];
}