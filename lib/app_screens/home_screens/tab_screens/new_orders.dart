import 'package:flutter/material.dart';
import 'package:flutter_dark_store/app_screens/home_screens/tab_screens/order_enum.dart';
import 'package:flutter_dark_store/model/order_model.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_item_container.dart';

class NewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<OrderModel> newOrder = OrderModel.itemModel
        .where((element) => element.orderType == "New Orders")
        .toList();
    return ListView(
        children: List.generate(
            newOrder.length,
            (index) => ReusableItemContainer(
                  order: newOrder[index],
                  type: OrderType.NEW_ORDER,
                )));
  }
}
