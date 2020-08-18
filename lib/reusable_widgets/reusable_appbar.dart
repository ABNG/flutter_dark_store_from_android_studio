import 'package:flutter/material.dart';
import 'package:flutter_dark_store/constants/const.dart';

import 'appbar_icon.dart';

class ReusableAppbar extends StatelessWidget {
  final String title;
  final body;

  ReusableAppbar({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: defaultStyle,
        ),
        actions: [
          AppbarIcon(),
        ],
      ),
      body: body,
    );
  }
}
