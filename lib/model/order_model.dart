class OrderModel {
  final String orderNumber;
  final double price;
  final String date;
  final String time;
  final String orderType;

  OrderModel(
      {this.orderNumber, this.price, this.date, this.time, this.orderType});

  static List<OrderModel> itemModel = [
    OrderModel(
      orderNumber: "15215165",
      price: 55.0,
      date: "12/06/2020",
      time: "06:05:11",
      orderType: "New Orders",
    ),
    OrderModel(
      orderNumber: "15215166",
      price: 56.0,
      date: "14/06/2020",
      time: "05:04:11",
      orderType: "New Orders",
    ),
    OrderModel(
      orderNumber: "15215167",
      price: 57.0,
      date: "15/06/2020",
      time: "05:04:11",
      orderType: "New Orders",
    ),
    OrderModel(
      orderNumber: "15215168",
      price: 58.0,
      date: "16/06/2020",
      time: "05:04:11",
      orderType: "Confirmed",
    ),
    OrderModel(
      orderNumber: "15215169",
      price: 59.0,
      date: "17/06/2020",
      time: "05:04:11",
      orderType: "Confirmed",
    ),
    OrderModel(
      orderNumber: "15215169",
      price: 59.0,
      date: "17/06/2020",
      time: "05:04:11",
      orderType: "Delivered",
    ),
    OrderModel(
      orderNumber: "15215168",
      price: 60.0,
      date: "17/06/2020",
      time: "05:04:11",
      orderType: "Delivered",
    ),
  ];
}
