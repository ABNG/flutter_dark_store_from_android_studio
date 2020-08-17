import 'package:flutter/material.dart';

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
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          AppbarIcon(),
        ],
      ),
      body: body,
    );
  }
}
