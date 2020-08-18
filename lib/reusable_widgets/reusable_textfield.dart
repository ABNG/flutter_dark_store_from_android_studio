import 'package:flutter/material.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';

class ReusableTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool main;
  final bool isPassword;

  ReusableTextField({this.text, this.icon, this.main, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * 0.08,
        vertical: 10,
      ),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 2,
              spreadRadius: 2,
            )
          ]),
      child: TextField(
        cursorColor: Colors.grey,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.grey[300],
            fontSize: 16,
          ),
          border: InputBorder.none,
          prefixIcon: main
              ? Icon(
                  icon,
                  color: Colors.grey[300],
                  size: 30,
                )
              : null,
          suffixIcon: main
              ? null
              : Icon(
                  icon,
                  color: Colors.grey[300],
                  size: 30,
                ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
