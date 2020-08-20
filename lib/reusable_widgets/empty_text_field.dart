import 'package:flutter/material.dart';
import 'package:flutter_dark_store/constants/const.dart';

class ReusableEmptyTextField extends StatelessWidget {
  final int maxLines;
  final TextEditingController controller;
  final isPassword;
  final Function onChange;
  final TextInputType textInputType;

  ReusableEmptyTextField({
    this.maxLines = 1,
    this.controller,
    this.onChange,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: EdgeInsets.only(left: 5),
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
        obscureText: isPassword,
        controller: controller,
        cursorColor: Colors.grey,
        maxLines: maxLines,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey[300],
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          isDense: true,
        ),
        style: defaultStyle,
        validator: (value) {
          if (value.isEmpty) {
            return "Field is Empty";
          }
          return null;
        },
        onChanged: onChange,
      ),
    );
  }
}
