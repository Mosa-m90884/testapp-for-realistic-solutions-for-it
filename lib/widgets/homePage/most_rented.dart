import '../../data/cars.dart';
import '../../widgets/homePage/car.dart';
import '../../widgets/homePage/category.dart';
import 'package:flutter/material.dart';

Widget buildMostRented(Size size, ThemeData themeData) {
  return Column(
    children: [
      buildCategory('Most Rented', size, themeData),
      Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.015,
          left: size.width * 0.03,
          right: size.width * 0.03,
        ),
        child: SizedBox(
          height: size.width * 0.9,
          width:  size.width * 0.9 ,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: cars.length,
            itemBuilder: (context, i) {
              return buildCar(
                i,
                size,
                themeData,
              );
            },
          ),
        ),
      ),
    ],
  );
}
