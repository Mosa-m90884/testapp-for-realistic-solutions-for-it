import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final Color color;
  final Color textColor;

  final Function() onPress;
  double fontSize = 12;

  CustomButton(
      {required this.onPress,
      this.textColor = Colors.white,
      this.text = 'Write text ',
      this.color = Colors.black26,
      this.width = 25,
      this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)),
      child: Container(
        width: width,
        height: 40,
        child: FlatButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.all(10),
          onPressed: onPress,
          color: color,
          child: CustomText(
            alignment: Alignment.center,
            text: text,
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
