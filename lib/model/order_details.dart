import 'package:flutter/material.dart';

class OrderDetail {
  final String detail;
  final String size;
  final Color color;
  final int quantity;
  final double price;
  final String image;

  OrderDetail(
      {this.detail,
      this.size,
      this.color,
      this.quantity,
      this.price,
      this.image});

  static List<OrderDetail> item_detail = [
    OrderDetail(
        detail: "BLUE WOMEN DRESS",
        size: "S",
        color: Colors.blueGrey,
        quantity: 2,
        price: 600.00,
        image: 'images/truck.png'),
    OrderDetail(
      detail: "GREY WOMEN HOODIE",
      size: "M",
      color: Colors.grey,
      quantity: 2,
      price: 350.00,
      image: 'images/truck.png',
    ),
    OrderDetail(
      detail: "GREY WOMEN HOODIE",
      size: "M",
      color: Colors.grey,
      quantity: 2,
      price: 350.00,
      image: 'images/truck.png',
    ),
  ];
}
