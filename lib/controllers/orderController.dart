import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:untitled1/imports.dart';

import '../model/order.dart';
import '../responses/order_response.dart';


class OrderProvider with ChangeNotifier{
  var _orders=<Order>[];
  bool addorder=false;
  List<Order> get orders=>_orders;
  Future<void> getOrders() async {
    var response = await Api.getOrders();
    print(response);
   var orderResponse = OrderResponse.fromJson(response.data);
    _orders.clear();
    _orders.addAll(orderResponse.orders);
    // print('${products[1].title}');

    notifyListeners();
  }

  Future<void>  addOrders({required Map<String, dynamic> orderData,required ProgressDialog  pr }) async {
   // _orders.add(value);
  pr.show();
    var response = await Api.placeOrder( orderData: orderData);
    if(response.data['success'])
      pr.hide();
 // getOrders();
  print(response.data['success']);
    addorder= response.data['success'];
    notifyListeners();
  }
  Future<void> deleteOrder(int id,ProgressDialog  pr) async {
    pr.show();
    var response = await Api.deleteOrder( id);
    getOrders();
    if(response.data['success'])
      pr.hide();
    notifyListeners();
  }
}