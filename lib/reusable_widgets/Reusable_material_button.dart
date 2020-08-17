import 'package:flutter/material.dart';

class ReusableMaterialButton extends StatelessWidget {
  final String title;
  final Function pressMe;
  final color;

  ReusableMaterialButton({this.title, this.pressMe, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: pressMe);
  }
}
