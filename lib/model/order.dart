import 'package:untitled1/imports.dart';

import 'cart_model.dart';

class OrderModel {
   final List<CartModel> carts;
  final String? status;

  OrderModel(this.carts, this.status);

}