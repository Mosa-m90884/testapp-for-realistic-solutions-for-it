import 'package:provider/provider.dart';
import 'package:untitled1/imports.dart';

class ProductProvider with ChangeNotifier {
  var _products = <Product>[];
  var productResponse;
  List<Product> get products => _products;
  int get index =>_index;
  int _index=0;
  changeIndex(int i){
    _index=i;
    notifyListeners();
  }

  Future<void> getProducts() async {
    var response = await Api.getProducts();
    print(response);
     productResponse = ProductResponse.fromJson(response.data);
    _products.clear();
    _products.addAll(productResponse.products);
   // print('${products[1].title}');

    notifyListeners();
  }
   search(String name){
     if (name.isNotEmpty) {
       _products =
           productResponse.products.where((e) => e.title.contains(name) ||
               e.title.startsWith(name)).toList();
      if( _products.length ==0)
        _products = productResponse.products;

     }else
       _products = productResponse.products;
     notifyListeners();

   }
  filterByRate(double value){
    if (value !=0.0) {
      var a= productResponse.products;
      _products =[];
     // _products = Product().where((e) => e.rating.rate>value);
      for(int i=0;i<a.length;i++){

        if(a[i].rating!.rate!>=value){
         print( a[i].rating!.rate!);
          _products.add(a[i]);}
      }
      if( _products.length ==0)
        _products = productResponse.products;

    }else
      _products = productResponse.products;
    notifyListeners();

  }
}
