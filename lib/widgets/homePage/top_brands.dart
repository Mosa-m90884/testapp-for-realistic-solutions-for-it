import '../../widgets/homePage/brand_logo.dart';
import '../../widgets/homePage/category.dart';
import 'package:flutter/material.dart';

Column buildTopBrands(Size size, ThemeData themeData) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: size.height * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildBrandLogo(
              Image.asset(
                'images/icons/hyundai.png',
                height: size.width * 0.1,
                width: size.width * 0.15,
                fit: BoxFit.fill,
              ),
              size,
              themeData,
            ),
            buildBrandLogo(
              Image.asset(
                'images/icons/volkswagen.png',
                height: size.width * 0.12,
                width: size.width * 0.12,
                fit: BoxFit.fill,
              ),
              size,
              themeData,
            ),
            buildBrandLogo(
              Image.asset(
                'images/icons/toyota.png',
                height: size.width * 0.08,
                width: size.width * 0.12,
                fit: BoxFit.fill,
              ),
              size,
              themeData,
            ),
            buildBrandLogo(
              Image.asset(
                'images/icons/bmw.png',
                height: size.width * 0.12,
                width: size.width * 0.12,
                fit: BoxFit.fill,
              ),
              size,
              themeData,
            ),
          ],
        ),
      ),
    ],
  );
}
