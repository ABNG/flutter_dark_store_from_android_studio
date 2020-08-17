import 'package:flutter_dark_store/model/order_details.dart';
import 'package:flutter_dark_store/model/order_model.dart';

class Utils {
  static double getTotalPrice(List<OrderModel> orders) {
    double price = 0;
    for (final order in orders) {
      price += order.price;
    }
    return price;
  }

  static double getTotalOrdersPrice(List<OrderDetail> orders) {
    double price = 0;
    for (final order in orders) {
      price += order.price;
    }
    return price;
  }

  static String getFormattedTime(String time) {
    int index = time.lastIndexOf(":");
    String subValue = time.substring(0, index) + " PM";
    return subValue;
  }
}
