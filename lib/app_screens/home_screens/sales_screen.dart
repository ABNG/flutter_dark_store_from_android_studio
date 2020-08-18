import 'package:flutter/material.dart';
import 'package:flutter_dark_store/app_screens/home_screens/tab_screens/order_enum.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/model/order_model.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_item_container.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_appbar.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';
import 'package:flutter_dark_store/utils/utils.dart';

class SaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<OrderModel> newOrder = OrderModel.itemModel
        .where((element) => element.orderType == "Delivered")
        .toList();

    return ReusableAppbar(
      title: "SALES",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: Color(0xffF6F9FF),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${newOrder.length}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        "TOTAL ORDERS",
                        style: defaultStyle,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color(0xffF6F6F6),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "AED ",
                              style: defaultStyle,
                            ),
                            Text(
                              "${Utils.getTotalPrice(newOrder).toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "TOTAL EARNINGS",
                        style: defaultStyle,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
            child: Text(
              "DELIVERED ORDERS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: List.generate(
                newOrder.length,
                (index) => ReusableItemContainer(
                  order: newOrder[index],
                  type: OrderType.DELIVERED,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
