import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dark_store/app_screens/login_screen.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppbarLogoutIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setBool(login_key, false);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LogInScreen()),
              (route) => false);
        },
        icon: Icon(
          Icons.power_settings_new,
          color: Colors.black,
        ));
  }
}
