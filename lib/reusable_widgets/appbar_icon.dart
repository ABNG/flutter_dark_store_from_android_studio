import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dark_store/app_screens/get_help.dart';

class AppbarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => GetHelp())),
      icon: Image.asset(
        'images/consulting.png',
        fit: BoxFit.cover,
        width: 24,
      ),
    );
  }
}
