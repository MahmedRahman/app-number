import 'package:flutter/cupertino.dart';

class Product {
  int id;
  String name;
  String price;
  int qty;

  Product(
    @required int id,
    @required String name,
    @required int Qty,
    @required String price,
  ) {
    this.id = id;
    this.name = name;
    this.qty = qty;
    this.price = price;
  }
}
