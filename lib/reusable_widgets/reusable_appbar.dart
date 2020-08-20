import 'package:flutter/material.dart';
import 'package:flutter_dark_store/constants/const.dart';

import 'appbar_icon.dart';
import 'appbar_logout_icon.dart';

class ReusableAppbar extends StatelessWidget {
  final String title;
  final body;
  final bool showIcon;
  final Key key;

  ReusableAppbar({this.title, this.body, this.key, this.showIcon = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: defaultStyle,
        ),
        actions: [
          showIcon ? AppbarIcon() : SizedBox(),
        ],
      ),
      body: body,
    );
  }
}
