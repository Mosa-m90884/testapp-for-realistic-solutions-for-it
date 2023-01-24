import '../imports.dart';

class CartModel {
  Product product;
  int quantity;

  CartModel({required this.product, required this.quantity});

  Map toJson() => {
        'id': product.id,
        'quantity': quantity,
      };
}
