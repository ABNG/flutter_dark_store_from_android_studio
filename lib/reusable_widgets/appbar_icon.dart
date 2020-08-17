import 'package:flutter/material.dart';
import 'package:flutter_dark_store/app_screens/get_help.dart';

class AppbarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => GetHelp())),
      icon: Icon(
        Icons.account_box,
        color: Colors.black,
        size: 30,
      ),
    );
  }
}
