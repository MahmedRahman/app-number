import 'package:get/get.dart';

import 'package:app_number/app/modules/Discount/bindings/discount_binding.dart';
import 'package:app_number/app/modules/Discount/views/discount_view.dart';
import 'package:app_number/app/modules/about/bindings/about_binding.dart';
import 'package:app_number/app/modules/about/views/about_view.dart';
import 'package:app_number/app/modules/acount/bindings/acount_binding.dart';
import 'package:app_number/app/modules/acount/views/acount_view.dart';
import 'package:app_number/app/modules/addressBook/bindings/address_book_binding.dart';
import 'package:app_number/app/modules/addressBook/views/address_book_view.dart';
import 'package:app_number/app/modules/address_add/bindings/address_add_binding.dart';
import 'package:app_number/app/modules/address_add/views/address_add_view.dart';
import 'package:app_number/app/modules/callus/bindings/callus_binding.dart';
import 'package:app_number/app/modules/callus/views/callus_view.dart';
import 'package:app_number/app/modules/cart/bindings/cart_binding.dart';
import 'package:app_number/app/modules/cart/views/cart_view.dart';
import 'package:app_number/app/modules/cart_address/bindings/cart_address_binding.dart';
import 'package:app_number/app/modules/cart_address/views/cart_address_view.dart';
import 'package:app_number/app/modules/cart_invoice/bindings/cart_invoice_binding.dart';
import 'package:app_number/app/modules/cart_invoice/views/cart_invoice_view.dart';
import 'package:app_number/app/modules/cart_payment/bindings/cart_payment_binding.dart';
import 'package:app_number/app/modules/cart_payment/views/cart_payment_view.dart';
import 'package:app_number/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:app_number/app/modules/checkout/views/checkout_view.dart';
import 'package:app_number/app/modules/coupon/bindings/coupon_binding.dart';
import 'package:app_number/app/modules/coupon/views/coupon_view.dart';
import 'package:app_number/app/modules/dashbord/bindings/dashbord_binding.dart';
import 'package:app_number/app/modules/dashbord/views/dashbord_view.dart';
import 'package:app_number/app/modules/department/bindings/department_binding.dart';
import 'package:app_number/app/modules/department/detail/bindings/department_detail_binding.dart';
import 'package:app_number/app/modules/department/detail/views/department_detail_view.dart';
import 'package:app_number/app/modules/department/views/department_view.dart';
import 'package:app_number/app/modules/department_sub/bindings/department_sub_binding.dart';
import 'package:app_number/app/modules/department_sub/views/department_sub_view.dart';
import 'package:app_number/app/modules/favourite/bindings/favourite_binding.dart';
import 'package:app_number/app/modules/favourite/views/favourite_view.dart';
import 'package:app_number/app/modules/home/bindings/home_binding.dart';
import 'package:app_number/app/modules/home/views/home_view.dart';
import 'package:app_number/app/modules/layout/bindings/layout_binding.dart';
import 'package:app_number/app/modules/layout/views/layout_view.dart';
import 'package:app_number/app/modules/merchantProductImage/bindings/merchant_product_image_binding.dart';
import 'package:app_number/app/modules/merchantProductImage/views/merchant_product_image_view.dart';
import 'package:app_number/app/modules/merchant_add_Contest/bindings/merchant_add_contest_binding.dart';
import 'package:app_number/app/modules/merchant_add_Contest/views/merchant_add_contest_view.dart';
import 'package:app_number/app/modules/merchant_add_Coupon/bindings/merchant_add_coupon_binding.dart';
import 'package:app_number/app/modules/merchant_add_Coupon/views/merchant_add_coupon_view.dart';
import 'package:app_number/app/modules/merchant_add_product/bindings/merchant_add_product_binding.dart';
import 'package:app_number/app/modules/merchant_add_product/views/merchant_add_product_view.dart';
import 'package:app_number/app/modules/merchant_add_status/bindings/merchant_add_status_binding.dart';
import 'package:app_number/app/modules/merchant_add_status/views/merchant_add_status_view.dart';
import 'package:app_number/app/modules/merchant_bord/bindings/merchant_bord_binding.dart';
import 'package:app_number/app/modules/merchant_bord/views/merchant_bord_view.dart';
import 'package:app_number/app/modules/merchant_contest/bindings/merchant_contest_binding.dart';
import 'package:app_number/app/modules/merchant_contest/views/merchant_contest_view.dart';
import 'package:app_number/app/modules/merchant_edit_product/bindings/merchant_edit_product_binding.dart';
import 'package:app_number/app/modules/merchant_edit_product/views/merchant_edit_product_view.dart';
import 'package:app_number/app/modules/merchant_home/bindings/merchant_home_binding.dart';
import 'package:app_number/app/modules/merchant_home/views/merchant_home_view.dart';
import 'package:app_number/app/modules/merchant_order/bindings/merchant_order_binding.dart';
import 'package:app_number/app/modules/merchant_order/views/merchant_order_view.dart';
import 'package:app_number/app/modules/merchant_product/bindings/merchant_product_binding.dart';
import 'package:app_number/app/modules/merchant_product/views/merchant_product_view.dart';
import 'package:app_number/app/modules/merchant_profile/bindings/merchant_profile_binding.dart';
import 'package:app_number/app/modules/merchant_profile/views/merchant_profile_view.dart';
import 'package:app_number/app/modules/merchant_profile_info/bindings/merchant_profile_info_binding.dart';
import 'package:app_number/app/modules/merchant_profile_info/views/merchant_profile_info_view.dart';
import 'package:app_number/app/modules/notifaction/bindings/notifaction_binding.dart';
import 'package:app_number/app/modules/notifaction/views/notifaction_view.dart';
import 'package:app_number/app/modules/orderBook/bindings/order_book_binding.dart';
import 'package:app_number/app/modules/orderBook/views/order_book_view.dart';
import 'package:app_number/app/modules/orderBookDetail/bindings/order_book_detail_binding.dart';
import 'package:app_number/app/modules/orderBookDetail/views/order_book_detail_view.dart';
import 'package:app_number/app/modules/product/bindings/product_binding.dart';
import 'package:app_number/app/modules/product/views/product_view.dart';
import 'package:app_number/app/modules/productadd/bindings/productadd_binding.dart';
import 'package:app_number/app/modules/productadd/views/productadd_view.dart';
import 'package:app_number/app/modules/profile/bindings/profile_binding.dart';
import 'package:app_number/app/modules/profile/views/profile_view.dart';
import 'package:app_number/app/modules/profile_info/bindings/profile_info_binding.dart';
import 'package:app_number/app/modules/profile_info/views/profile_info_view.dart';
import 'package:app_number/app/modules/quiz/bindings/quiz_binding.dart';
import 'package:app_number/app/modules/quiz/views/quiz_view.dart';
import 'package:app_number/app/modules/shopstatus/bindings/shopstatus_binding.dart';
import 'package:app_number/app/modules/shopstatus/views/shopstatus_view.dart';
import 'package:app_number/app/modules/signin/bindings/signin_binding.dart';
import 'package:app_number/app/modules/signin/views/signin_view.dart';
import 'package:app_number/app/modules/signup/bindings/signup_binding.dart';
import 'package:app_number/app/modules/signup/views/signup_view.dart';
import 'package:app_number/app/modules/splash/bindings/splash_binding.dart';
import 'package:app_number/app/modules/splash/views/splash_view.dart';
import 'package:app_number/app/modules/trader/bindings/trader_binding.dart';
import 'package:app_number/app/modules/trader/views/trader_view.dart';
import 'package:app_number/app/modules/trems/bindings/trems_binding.dart';
import 'package:app_number/app/modules/trems/views/trems_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

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
      children: [],
    ),
    GetPage(
      name: _Paths.DEPARTMENT_DETAIL,
      page: () => DepartmentDetailView(),
      binding: DepartmentDetailBinding(),
    ),
    GetPage(
      name: _Paths.TRADER,
      page: () => TraderView(),
      binding: TraderBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFACTION,
      page: () => NotifactionView(),
      binding: NotifactionBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITE,
      page: () => FavouriteView(),
      binding: FavouriteBinding(),
    ),
    GetPage(
      name: _Paths.SHOPSTATUS,
      page: () => ShopstatusView(),
      binding: ShopstatusBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.DISCOUNT,
      page: () => DiscountView(),
      binding: DiscountBinding(),
    ),
    GetPage(
      name: _Paths.DEPARTMENT_SUB,
      page: () => DepartmentSubView(),
      binding: DepartmentSubBinding(),
    ),
    GetPage(
      name: _Paths.COUPON,
      page: () => CouponView(),
      binding: CouponBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTADD,
      page: () => ProductaddView(),
      binding: ProductaddBinding(),
    ),
    GetPage(
      name: _Paths.DASHBORD,
      page: () => DashbordView(),
      binding: DashbordBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_BORD,
      page: () => MerchantBordView(),
      binding: MerchantBordBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_HOME,
      page: () => MerchantHomeView(),
      binding: MerchantHomeBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_PRODUCT,
      page: () => MerchantProductView(),
      binding: MerchantProductBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_ORDER,
      page: () => MerchantOrderView(),
      binding: MerchantOrderBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_PROFILE,
      page: () => MerchantProfileView(),
      binding: MerchantProfileBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_ADD_PRODUCT,
      page: () => MerchantAddProductView(),
      binding: MerchantAddProductBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_ADD_STATUS,
      page: () => MerchantAddStatusView(),
      binding: MerchantAddStatusBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_ADD_CONTEST,
      page: () => MerchantAddContestView(),
      binding: MerchantAddContestBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_ADD_COUPON,
      page: () => MerchantAddCouponView(),
      binding: MerchantAddCouponBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.CART_ADDRESS,
      page: () => CartAddressView(),
      binding: CartAddressBinding(),
    ),
    GetPage(
      name: _Paths.CART_PAYMENT,
      page: () => CartPaymentView(),
      binding: CartPaymentBinding(),
    ),
    GetPage(
      name: _Paths.CART_INVOICE,
      page: () => CartInvoiceView(),
      binding: CartInvoiceBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_ADD,
      page: () => AddressAddView(),
      binding: AddressAddBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_BOOK,
      page: () => AddressBookView(),
      binding: AddressBookBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_BOOK,
      page: () => OrderBookView(),
      binding: OrderBookBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CALLUS,
      page: () => CallusView(),
      binding: CallusBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.TREMS,
      page: () => TremsView(),
      binding: TremsBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_BOOK_DETAIL,
      page: () => OrderBookDetailView(),
      binding: OrderBookDetailBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_CONTEST,
      page: () => MerchantContestView(),
      binding: MerchantContestBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_INFO,
      page: () => ProfileInfoView(),
      binding: ProfileInfoBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_PROFILE_INFO,
      page: () => MerchantProfileInfoView(),
      binding: MerchantProfileInfoBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_PRODUCT_IMAGE,
      page: () => MerchantProductImageView(),
      binding: MerchantProductImageBinding(),
    ),
    GetPage(
      name: _Paths.MERCHANT_EDIT_PRODUCT,
      page: () => MerchantEditProductView(),
      binding: MerchantEditProductBinding(),
    ),
  ];
}
