import 'package:flutter/material.dart';
import 'package:flutter_dark_store/app_screens/home_screens/add_products.dart';
import 'package:flutter_dark_store/app_screens/home_screens/my_order_screen.dart';
import 'package:flutter_dark_store/app_screens/home_screens/sales_screen.dart';
import 'package:flutter_dark_store/app_screens/home_screens/stored_info.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/reusable_widgets/appbar_icon.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_logo.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';

const List<Map<String, dynamic>> itemList = [
  {
    "icon": 'images/truck.png',
    "title": "ADD PRODUCT",
    "page": 1,
  },
  {
    "icon": 'images/truck.png',
    "title": "MY ORDERS",
    "page": 2,
  },
  {
    "icon": 'images/truck.png',
    "title": "MY PRODUCT",
    "page": 3,
  },
  {
    "icon": 'images/truck.png',
    "title": "SALES",
    "page": 4,
  },
  {
    "icon": 'images/truck.png',
    "title": "STORE INFO",
    "page": 5,
  }
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: ReusableLogo(
          fontSize: 20,
          letterSpacing: 5.5,
        ),
        actions: [AppbarIcon()],
      ),
      body: ListView(
        children: List.generate(
          itemList.length,
          (index) => GestureDetector(
            onTap: () {
              switch (itemList[index]['page']) {
                case 1:
                  navigation(context, AddProducts());
                  break;
                case 2:
                  navigation(context, MyOrderScreen());
                  break;
                case 3:
                  print("page 3");
                  break;
                case 4:
                  navigation(context, SaleScreen());
                  break;
                case 5:
                  navigation(context, StoredInfo());
                  break;
              }
            },
            child: Container(
              height: SizeConfig.screenHeight * 0.1,
              margin: EdgeInsets.only(bottom: 5),
              color: index % 2 == 0 ? Colors.grey[100] : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    itemList[index]['icon'],
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 120,
                    child: Text(
                      itemList[index]['title'],
                      style: defaultStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigation(BuildContext context, Object page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }
}
