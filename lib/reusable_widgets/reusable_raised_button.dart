import 'package:flutter/material.dart';

class ReusableRaisedButton extends StatelessWidget {
  final String text;
  final color;
  final double height;
  final Function pressMe;
  final Color btnColor;

  ReusableRaisedButton(
      {this.text,
      this.color,
      this.pressMe,
      this.btnColor = Colors.white,
      this.height = 30});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: height == 30.0
                ? BorderRadius.circular(5)
                : BorderRadius.circular(0)),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(color: btnColor, fontWeight: FontWeight.bold),
          ),
        ),
        color: color,
        onPressed: pressMe,
      ),
    );
  }
}
