import 'package:provider/provider.dart';
import 'package:untitled1/imports.dart';

import '../model/order.dart';


class OrderProvider with ChangeNotifier{
  var _orders=<OrderModel>[];
  List<OrderModel> get orders=>_orders;
  Future<void> addOrders(OrderModel value ) async {
    _orders.add(value);
    notifyListeners();
  }
  Future<void> deleteOrder(int id) async {
    _orders.removeAt(id);
    notifyListeners();
  }
}