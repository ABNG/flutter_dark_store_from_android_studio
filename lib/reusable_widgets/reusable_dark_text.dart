import 'package:flutter/material.dart';
import 'package:flutter_dark_store/constants/const.dart';

class ReusableDarkText extends StatelessWidget {
  final String text;

  ReusableDarkText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: defaultStyle.copyWith(fontSize: 12),
    );
  }
}
