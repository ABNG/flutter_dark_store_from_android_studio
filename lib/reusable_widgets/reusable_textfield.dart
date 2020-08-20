import 'package:flutter/material.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';

class ReusableTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool main;
  final bool isPassword;
  final TextEditingController controller;
  final Function onChange;
  final TextInputType textInputType;

  ReusableTextField(
      {this.text,
      this.icon,
      this.main,
      this.controller,
      this.onChange,
      this.textInputType = TextInputType.text,
      this.isPassword = false});

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
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        cursorColor: Colors.grey,
        obscureText: isPassword,
        validator: (value) {
          if (value.isEmpty) {
            return "Field is Empty";
          } else if (textInputType == TextInputType.emailAddress) {
            RegExp exp = RegExp(
                r"^[a-zA-Z0-9]+@[a-z]+\.\w{3}$"); // r"^[a-zA-Z0-9]+@(gmail|yahoo|outlook)\.\w{3}$"
            if (exp.hasMatch(value) == false) {
              return "email format mismatch";
            }
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.grey[350],
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
        onChanged: onChange,
        style: defaultStyle,
      ),
    );
  }
}
