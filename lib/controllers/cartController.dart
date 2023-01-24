import '../../imports.dart';

class CartItems with ChangeNotifier {
  List<CartModel> _items = [];

  List<CartModel> get items {
    return _items;
  }

  int get itemCount {
    return _items.length;
  }

  addProductToCart(Product product, int quantity) {
    print("adding ${product.title}");
    CartModel? found = _items.firstWhere((p) => p.product.id == product.id,
        orElse: () => CartModel(product: Product(id: 0), quantity: 0));
    if (found.product.id != 0) {
      found.quantity += quantity;
    } else {
      _items.add(CartModel(quantity: quantity, product: product));
      //product.quantity += 1;
    }
    _items.forEach((element) {
      print("cartttt:${element.quantity}");
    });
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}
