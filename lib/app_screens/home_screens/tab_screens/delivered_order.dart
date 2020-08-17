import 'package:flutter/material.dart';
import 'package:flutter_dark_store/model/order_model.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_item_container.dart';

import 'order_enum.dart';

class DeliveredOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<OrderModel> newOrder = OrderModel.itemModel
        .where((element) => element.orderType == "Delivered")
        .toList();

    return ListView(
        children: List.generate(
            newOrder.length,
            (index) => ReusableItemContainer(
                  order: newOrder[index],
                  type: OrderType.DELIVERED,
                )));
  }
}
