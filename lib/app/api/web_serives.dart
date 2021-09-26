import 'dart:io';

import 'package:app_number/app/api/api_manger.dart';
import 'package:app_number/app/api/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebServices extends APIManger {
  Future<ResponsModel> getProducts() async {
    ResponsModel response = await repGet('products');
    return response;
  }

  Future<ResponsModel> getOrdersBook() async {
    ResponsModel response = await repGet('orders/index', showLoading: true);
    return response;
  }

  Future<ResponsModel> getProduct({@required id}) async {
    ResponsModel response = await repGet('product?id=$id');
    return response;
  }

  Future<ResponsModel> getCategories() async {
    ResponsModel response = await repGet('categories');
    return response;
  }

  Future<ResponsModel> getCategorieProducts({@required id}) async {
    ResponsModel response = await repGet('products/category?category_id=$id');
    return response;
  }

  Future<ResponsModel> signin({@required email, @required password}) async {
    ResponsModel response = await repPost(
        'login',
        {
          'email': email,
          'password': password,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> getSearchProduct({@required search}) async {
    ResponsModel response = await repGet(
      'products/search?keyword=${search.toString()}',
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> getSlider() async {
    ResponsModel response = await repGet(
      'slider',
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> merchantSignup({
    @required name,
    @required email,
    @required mobile,
    @required password,
    @required city,
    @required File image,
  }) async {
    final form = FormData({
      'name_ar': name,
      'email': email,
      'phone': mobile,
      'password': password,
      'city': city,
      'image': GetUtils.isNull(image)
          ? ''
          : MultipartFile(image, filename: 'temp.png'),
    });

    ResponsModel response =
        await repPost('merchant/register', form, showLoading: true);
    return response;
  }

  Future<ResponsModel> signup({
    @required name,
    @required email,
    @required mobile,
    @required city,
    @required password,
  }) async {
    ResponsModel response = await repPost(
        'register',
        {
          'name': name,
          'email': email,
          'mobile': mobile,
          'city': city,
          'password': password,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> getProfile() async {
    ResponsModel response = await repGet('profile/show');
    return response;
  }

  Future<ResponsModel> editProfile({
    @required name,
    @required phone,
  }) async {
    ResponsModel response = await repPost('profile/edit', {
      'name': name,
      'mobile': phone,
    });
    return response;
  }

  Future<ResponsModel> getTax() async {
    ResponsModel response = await repGet('orders/tax');
    return response;
  }

  Future<ResponsModel> getShippingOrders({address_id, products}) async {
    ResponsModel response = await repPost('orders/shipping', {
      'address_id': address_id.toString(),
      'products': products,
    });
    return response;
  }

  Future<ResponsModel> getMerchants() async {
    ResponsModel response = await repGet('merchants', showLoading: true);
    return response;
  }

  Future<ResponsModel> getStatuses() async {
    ResponsModel response = await repGet('statuses', showLoading: true);
    return response;
  }

  Future<ResponsModel> getshipping({address_id}) async {
    ResponsModel response = await repGet('shipping?address_id=$address_id');
    return response;
  }

  Future<ResponsModel> getdiscount({discount_coupon}) async {
    ResponsModel response =
        await repGet('discount?discount_coupon=$discount_coupon');
    return response;
  }

  Future<ResponsModel> addCart(
      {@required product_id, @required quantity}) async {
    ResponsModel response = await repPost(
        'cart/add?product_id=$product_id&quantity=$quantity', {},
        showLoading: true);
    return response;
  }

  Future<ResponsModel> updateCart(
      {@required item_id, @required quantity}) async {
    ResponsModel response = await repPost(
        'cart/update?item_id=$item_id&quantity=$quantity', {},
        showLoading: true);
    return response;
  }

  Future<ResponsModel> deleteCart({@required item_id}) async {
    ResponsModel response =
        await repPost('cart/delete?id=$item_id', {}, showLoading: true);
    return response;
  }

  Future<ResponsModel> getCart() async {
    ResponsModel response = await repGet('cart/index', showLoading: true);
    return response;
  }

  Future<ResponsModel> createOrders({
    @required address_id,
    products,
    qty,
    detail,
    reciving,
  }) async {
    ResponsModel response = await repPost(
        'orders/create',
        {
          'address_id': address_id,
          'payment_method': 1,
          'products': products,
          'qty': qty,
          'detail': detail,
          'reciving': reciving,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> getWishlist() async {
    ResponsModel response = await repGet('wishlist/index', showLoading: true);
    return response;
  }

  Future<ResponsModel> addWishlist({@required productid}) async {
    ResponsModel response = await repPost(
      'wishlist/add',
      {
        'product_id': productid,
      },
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> deleteWishlist({@required productid}) async {
    ResponsModel response = await repPost(
        'wishlist/delete',
        {
          'id': productid,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> deleteProductsImage({@required imageid}) async {
    ResponsModel response = await repPost(
        'merchant/products/images/delete',
        {
          'image_id': imageid,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> getAddresses() async {
    ResponsModel response = await repGet('addresses/index');
    return response;
  }

  Future<ResponsModel> addAddresses({
    @required city_id,
    @required name,
    @required area,
    @required street,
    @required building,
    @required apartment,
  }) async {
    ResponsModel response = await repPost(
        'addresses/add',
        {
          'city_id': city_id,
          'name': name,
          'area': area,
          'street': street,
          'building': building,
          'apartment': apartment,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> editAddresses({
    @required addressid,
    @required cityid,
    @required name,
    @required area,
    @required street,
    @required building,
    @required apartment,
  }) async {
    ResponsModel response = await repPost(
        'addresses/add',
        {
          'address_id': addressid,
          'city_id': cityid,
          'name': name,
          'area': area,
          'street': street,
          'building': building,
          'apartment': apartment,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> deleteAddresses({@required addressesId}) async {
    ResponsModel response = await repPost(
        'addresses/delete',
        {
          'id': addressesId,
        },
        showLoading: true);
    return response;
  }

//Merchant

  Future<ResponsModel> signinMerchant(
      {@required email, @required password}) async {
    ResponsModel response = await repPost(
        'merchant/login',
        {
          'email': email,
          'password': password,
        },
        showLoading: true);
    return response;
  }

//Products.Merchant
  Future<ResponsModel> getProductsColorsMerchant() async {
    ResponsModel response = await repGet('merchant/products/colors');
    return response;
  }

  Future<ResponsModel> getProductsSizesMerchant() async {
    ResponsModel response = await repGet('merchant/products/sizes');
    return response;
  }

  Future<ResponsModel> getProductsMerchant() async {
    ResponsModel response = await repGet('merchant/products/index');
    return response;
  }

  Future<ResponsModel> getProductMerchant({@required id}) async {
    ResponsModel response = await repGet('merchant/products/show?id=$id');
    return response;
  }

  Future<ResponsModel> addProductsMerchant(
      {@required categoryId,
      @required productName,
      @required price,
      @required discount,
      @required stock,
      @required description}) async {
    ResponsModel response = await repPost(
        'merchant/products/add',
        {
          'category_id': categoryId,
          'name_ar': productName,
          'description': description,
          'price': price,
          'discount': discount,
          'stock': stock,
          'colors': '',
          'sizes': '',
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> editProductsMerchant(
      {@required productId,
      @required categoryId,
      @required productName,
      @required price,
      @required discount,
      @required stock,
      @required description}) async {
    ResponsModel response = await repPost(
        'merchant/products/edit',
        {
          'product_id': productId,
          'category_id': categoryId,
          'name_ar': productName,
          'description': description,
          'price': price,
          'discount': discount,
          'stock': stock,
          'colors': '',
          'sizes': '',
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> deleteProductsMerchant({
    @required productid,
  }) async {
    ResponsModel response = await repPost('merchant/products/delete', {
      'id': productid,
    });
    return response;
  }

//Orders Merchant
  Future<ResponsModel> getOrdersMerchant() async {
    ResponsModel response = await repGet('merchant/orders/index');
    return response;
  }

//Orders Merchant
  Future<ResponsModel> addProductsImages({
    @required String product_id,
    @required File image,
  }) async {
    ResponsModel response = await repPost(
      'merchant/products/images/add',
      FormData({
        'product_id': product_id,
        'image': GetUtils.isNull(image)
            ? ''
            : MultipartFile(image, filename: 'temp.png'),
      }),
      showLoading: true,
    );

    return response;
  }

//Orders Merchant
  Future<ResponsModel> deleteProductsImages() async {
    ResponsModel response = await repGet('products/images/delete');
    return response;
  }

//products/images/delete

//Status Merchant

  Future<ResponsModel> getStatusMerchant() async {
    ResponsModel response = await repGet('merchant/status/index');
    return response;
  }

  Future<ResponsModel> addStatusMerchant({
    @required text,
    @required File statusImage,
    @required statusvideo,
  }) async {
    // MultipartFile(file, filename: 'temp.jpg')
    final form = FormData({
      'text': text,
      'image': GetUtils.isNull(statusImage)
          ? ''
          : MultipartFile(statusImage, filename: 'temp.png'),
    });

    ResponsModel response =
        await repPost('merchant/status/add', form, showLoading: true);

    return response;
  }

  Future<ResponsModel> deleteStatusMerchant({
    @required statusId,
  }) async {
    ResponsModel response = await repPost('merchant/status/delete', {
      'id': statusId,
    });
    return response;
  }

  Future<ResponsModel> subscribeRequestMerchant() async {
    ResponsModel response = await repPost(
      'merchant/subscribe_request',
      {},
    );
    return response;
  }

//Quize

  Future<ResponsModel> getQuizMerchant() async {
    ResponsModel response = await repGet('merchant/quiz/index');
    return response;
  }

  Future<ResponsModel> addQuizMerchant({
    @required text,
    @required File image,
    @required prize,
  }) async {
    final form = FormData({
      'text': text,
      'image': GetUtils.isNull(image)
          ? ''
          : MultipartFile(image, filename: 'temp.png'),
      'prize': prize,
      'answer1': 'test1',
      'answer2': 'test1',
      'answer3': 'test1',
      'correct_answer': 'test1',
    });

    ResponsModel response = await repPost(
      'merchant/quiz/add',
      form,
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> deleteQuizMerchant({
    @required quizId,
  }) async {
    ResponsModel response = await repPost('merchant/quiz/delete', {
      'id': quizId,
    });
    return response;
  }

//coupons

  Future<ResponsModel> getCouponsMerchant() async {
    ResponsModel response = await repGet('merchant/coupons/index');
    return response;
  }

  Future<ResponsModel> addCouponsMerchant({
    @required name,
    @required discount,
    @required expireAt,
  }) async {
    ResponsModel response = await repPost('merchant/coupons/add', {
      'name': name,
      'discount': discount,
      'expire_at': expireAt,
    });
    return response;
  }

  Future<ResponsModel> deleteCouponsMerchant({
    @required couponsId,
  }) async {
    ResponsModel response = await repPost('merchant/coupons/delete', {
      'id': couponsId,
    });
    return response;
  }

//Merchant Profile

  Future<ResponsModel> getProfileMerchant() async {
    ResponsModel response = await repGet('merchant/profile/show');
    return response;
  }

  Future<ResponsModel> editProfileMerchant({
    @required name,
    @required phone,
    @required city,
    @required File profileImage,
  }) async {
    final form = FormData({
      'name': name,
      'phone': phone,
      'city': city,
      'image': GetUtils.isNull(profileImage)
          ? ''
          : MultipartFile(profileImage, filename: 'temp.png'),
    });

    ResponsModel response =
        await repPost('merchant/profile/edit', form, showLoading: true);
    return response;
  }

  Future<ResponsModel> profileChangePasswordMerchant({
    @required oldPassword,
    @required newPassword,
  }) async {
    ResponsModel response = await repPost('merchant/profile/password', {
      'old_password': oldPassword,
      'new_password': newPassword,
    });
    return response;
  }

  Future<ResponsModel> approveOrderMerchant({
    @required order,
  }) async {
    ResponsModel response = await repPost(
      'merchant/orders/approve_order?order=$order',
      {},
    );
    return response;
  }

  Future<ResponsModel> profileChangePassword({
    @required oldPassword,
    @required newPassword,
  }) async {
    ResponsModel response = await repPost('profile/password', {
      'old_password': oldPassword,
      'new_password': newPassword,
    });
    return response;
  }
}
