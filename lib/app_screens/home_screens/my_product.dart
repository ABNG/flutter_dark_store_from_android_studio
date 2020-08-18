import 'package:flutter/material.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_appbar.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_raised_button.dart';

class MyProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableAppbar(
      title: "My PRODUCTS",
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              style: defaultStyle,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                filled: true,
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //TODO: USE MEDIA QUERY INSIDE GRID CHILD
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                childAspectRatio: 0.83,
                children: [
                  Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          child: Placeholder(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("hello"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "99.00",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              "AED",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ReusableRaisedButton(
                                text: "Remove",
                                pressMe: () {},
                                color: Colors.red,
                                height: 35,
                              ),
                            ),
                            Expanded(
                              child: ReusableRaisedButton(
                                text: "Edit",
                                pressMe: () {},
                                color: Colors.green,
                                height: 35,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
