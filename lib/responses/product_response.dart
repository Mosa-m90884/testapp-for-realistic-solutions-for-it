import 'package:untitled1/imports.dart';

class ProductResponse {
  late List<Product> products = [];

  ProductResponse.fromJson(dynamic json) {
    json.forEach((product) => products.add(Product.fromJson(product)));
  }
} //end of response
