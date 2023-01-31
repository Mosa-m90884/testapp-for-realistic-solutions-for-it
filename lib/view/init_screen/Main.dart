import 'package:flutter/material.dart';

import '../../imports.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  final screens = [HomePage(), OrderPage()];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    int ind = 0;
    if (Provider.of<ProductProvider>(context).products.length == 0)
      Provider.of<ProductProvider>(context, listen: false).getProducts();
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        selectedLabelStyle: TextStyle(fontSize: 16),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          Provider.of<ProductProvider>(context, listen: false)
              .changeIndex(index);
          if (index == 1) {
            Provider.of<OrderProvider>(context, listen: false).getOrders();
          }
        },
        currentIndex: Provider.of<ProductProvider>(context, listen: true).index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'order'),
        ],
      ),
      body: widget
          .screens[Provider.of<ProductProvider>(context, listen: true).index],
    ));
  }
}

class Pofile extends StatelessWidget {
  const Pofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
