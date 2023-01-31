import '../../widgets/homePage/car.dart';
import '../../widgets/homePage/category.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/imports.dart';

class buildMostRented extends StatelessWidget {
  buildMostRented({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    ThemeData themeData = Theme.of(context);

    return Column(
      children: [
        buildCategory('Most Rented', size, themeData, context),
        Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.03,
            right: size.width * 0.03,
          ),
          child: SizedBox(
            height: size.height * 0.5,
            width: size.width * 0.9,
            child: ListView.builder(
              primary: false,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: Provider.of<ProductProvider>(context).products.length,
              itemBuilder: (context, i) {
                return buildCar(
                    car: Provider.of<ProductProvider>(context).products[i]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
