import 'package:flutter/material.dart';

class ReusableDarkText extends StatelessWidget {
  final String text;

  ReusableDarkText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
    );
  }
}
