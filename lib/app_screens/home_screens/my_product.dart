import 'package:flutter/material.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/model/my_product.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_appbar.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_raised_button.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';

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
                childAspectRatio: 0.78,
                children: List.generate(
                  MyProducts.myProducts.length,
                  (index) => Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: SizeConfig.screenHeight * 0.15,
                          child: Image.asset(
                            MyProducts.myProducts[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Spacer(),
                        Text(MyProducts.myProducts[index].name),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "${MyProducts.myProducts[index].price}",
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
                        Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: ReusableRaisedButton(
                                text: "Remove",
                                pressMe: () {},
                                color: Colors.red,
                                height: SizeConfig.screenHeight * 0.04,
                              ),
                            ),
                            Expanded(
                              child: ReusableRaisedButton(
                                text: "Edit",
                                pressMe: () {},
                                color: Colors.green,
                                height: SizeConfig.screenHeight * 0.04,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
