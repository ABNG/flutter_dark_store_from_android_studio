import 'package:flutter/material.dart';

class ReusableEmptyTextField extends StatelessWidget {
  final int maxLines;

  ReusableEmptyTextField({this.maxLines = 1});

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
        child: TextField(
          cursorColor: Colors.grey,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.grey[300],
              fontSize: 16,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10),
            isDense: true,
          ),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
