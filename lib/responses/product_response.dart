import 'package:untitled1/imports.dart';

class ProductResponse {
  late List<Product> products = [];

  ProductResponse.fromJson(Map<String, dynamic> json) {
    json['data']
        .forEach((product) => products.add(Product.fromJson(product)));
  }
} //end of response
