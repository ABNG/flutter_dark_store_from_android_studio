import 'package:flutter/material.dart';
import 'package:flutter_dark_store/app_screens/home_screens/tab_screens/confirmed_order.dart';
import 'package:flutter_dark_store/app_screens/home_screens/tab_screens/delivered_order.dart';
import 'package:flutter_dark_store/app_screens/home_screens/tab_screens/new_orders.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/reusable_widgets/appbar_icon.dart';

class MyOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "MY ORDERS",
            style: defaultStyle,
          ),
          actions: [AppbarIcon()],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: kToolbarHeight - 20),
              child: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 5.0,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white, //this is by default color
                labelPadding: EdgeInsets.only(bottom: 5.0),
                tabs: [
                  Text("NEW ORDERS"),
                  Text("CONFIRMED"),
                  Text("DELIVERED"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [NewOrders(), ConfirmedOrder(), DeliveredOrder()],
        ),
      ),
    );
  }
}
