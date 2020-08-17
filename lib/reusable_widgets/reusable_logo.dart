import 'package:flutter/material.dart';

class ReusableLogo extends StatelessWidget {
  final double fontSize;
  final double letterSpacing;

  ReusableLogo({this.fontSize, this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      "DARK",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "Asset",
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          letterSpacing: letterSpacing),
    );
  }
}
