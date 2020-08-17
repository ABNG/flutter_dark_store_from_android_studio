import 'package:flutter/material.dart';
import 'package:flutter_dark_store/app_screens/home_screens/order_details.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_raised_button.dart';

import '../app_screens/home_screens/tab_screens/order_enum.dart';

class ReusableItemContainer extends StatelessWidget {
  final order;
  final OrderType type;

  ReusableItemContainer({this.order, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 135,
      color: Colors.grey[200],
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(6),
              child: Text(
                "ORDER# ${order.orderNumber}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 30),
              child: Text(
                "AED ${order.price}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 7,
            child: Text(
              "DATE: ${order.date}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 7,
            child: Text(
              "TIME: ${order.time}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 7,
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => OrderDetails(
                            order: order,
                          ))),
              child: Image.asset(
                'images/view_order.png',
                fit: BoxFit.cover,
                width: 120,
              ),
            ),
          ),
          type == OrderType.DELIVERED
              ? SizedBox()
              : Positioned(
                  bottom: 8,
                  child: Row(
                    children: [
                      type == OrderType.CONFIRMED
                          ? SizedBox()
                          : ReusableRaisedButton(
                              text: "REJECT",
                              color: Colors.red,
                              pressMe: () {},
                            ),
                      SizedBox(
                        width: 15,
                      ),
                      ReusableRaisedButton(
                        text: type == OrderType.CONFIRMED
                            ? "READY FOR SHIPPING"
                            : "ACCEPT",
                        color: Colors.black,
                        pressMe: () {},
                      ),
                    ],
                  )),
        ],
      ),
    );
  }
}
