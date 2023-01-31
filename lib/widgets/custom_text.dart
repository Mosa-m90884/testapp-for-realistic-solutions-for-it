import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color color;
  final TextStyle? style;
  final Alignment alignment;

  final int? maxLine;
  final double height;

  CustomText({
    this.style = null,
    this.text = '',
    this.fontSize = 12,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.maxLine,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: style == null
            ? GoogleFonts.poppins(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              )
            : style,
        maxLines: maxLine,
      ),
    );
  }
}
