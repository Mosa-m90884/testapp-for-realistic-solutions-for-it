import 'package:untitled1/model/order.dart';

class OrderResponse {
  late List<Order> orders = [];

  OrderResponse.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((order) => orders.add(Order.fromJson(order)));
  }
} //end of response
