import 'package:flutter/material.dart';
import 'package:flutter_dark_store/model/order_details.dart';
import 'package:flutter_dark_store/model/order_model.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_appbar.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_dark_text.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_raised_button.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';
import 'package:flutter_dark_store/utils/utils.dart';

class OrderDetails extends StatelessWidget {
  final OrderModel order;

  OrderDetails({this.order});

  @override
  Widget build(BuildContext context) {
    return ReusableAppbar(
      title: "MY ORDERS",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableDarkText(
                        text: "ORDER NUMBER - ${order.orderNumber}",
                      ),
                      ReusableText(
                        text:
                            "PLACED ON: ${order.date} - ${Utils.getFormattedTime(order.time)}",
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Divider(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableDarkText(
                        text: "SHIPPING ADDRESS",
                      ),
                      ReusableText(
                        text: "CITY: ABU DHABI",
                        padding: const EdgeInsets.only(top: 2),
                      ),
                      ReusableText(
                        text: "ADDRESS: AL REEM ISLAND",
                        padding: const EdgeInsets.only(top: 2),
                      ),
                      ReusableText(
                        text: "BUILDING / APARTMENT NUMBER: BLUE TOWER 805",
                        padding: const EdgeInsets.only(top: 2),
                      ),
                      ReusableText(
                        text: "CONTACT NUMBER: 0507865765",
                        padding: const EdgeInsets.only(top: 2),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ReusableTitle(
                    title: "ORDER DETAILS",
                  ),
                ),
                LimitedBox(
                  maxHeight: SizeConfig.screenHeight * 0.35,
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        OrderDetail.item_detail.length,
                        (index) => Container(
                          width: double.infinity,
                          color: Colors.grey[100],
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableDarkText(
                                      text:
                                          OrderDetail.item_detail[index].detail,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ReusableDarkText(
                                      text:
                                          "SIZE: ${OrderDetail.item_detail[index].size}",
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        ReusableDarkText(
                                          text: "COLOR: ",
                                        ),
                                        Container(
                                          width: 30,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              color: OrderDetail
                                                  .item_detail[index].color,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey[200],
                                                  blurRadius: 8,
                                                  spreadRadius: 3,
                                                )
                                              ]),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReusableDarkText(
                                          text:
                                              "QUANTITY: ${OrderDetail.item_detail[index].quantity}",
                                        ),
                                        Text(
                                          "AED ${OrderDetail.item_detail[index].price}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                    width: 120,
                                    height: 140,
                                    child: Image.asset(
                                      'images/dummy.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ReusableTitle(
                    title: "ORDER SUMMARY",
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Table(
                    columnWidths: {1: FractionColumnWidth(.5)},
                    children: [
                      TableRow(
                        children: [
                          Text(""),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child:
                                MediaQuery.of(context).size.shortestSide < 600
                                    ? FittedBox(
                                        child: ReusableDarkText(
                                          text: "PAYMENT METHOD: CREDIT CARD",
                                        ),
                                      )
                                    : ReusableDarkText(
                                        text: "PAYMENT METHOD: CREDIT CARD",
                                      ),
                          ),
                          Text(""),
                        ],
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ReusableDarkText(
                            text: "SUB TOTAL",
                          ),
                        ),
                        Text(""),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ReusableDarkText(
                            text:
                                "AED ${Utils.getTotalOrdersPrice(OrderDetail.item_detail).round()}",
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Text(""),
                        Text(""),
                        Text(""),
                      ]),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: ReusableDarkText(
                              text: "SHIPPING FEE",
                            ),
                          ),
                          Text(""),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: ReusableDarkText(
                              text: "AED 30",
                            ),
                          ),
                        ],
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ReusableDarkText(
                            text: "TOTAL",
                          ),
                        ),
                        Text(""),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ReusableDarkText(
                            text:
                                "AED ${Utils.getTotalOrdersPrice(OrderDetail.item_detail).round() + 30}",
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableRaisedButton(
                  text: "ACCEPT",
                  color: Colors.black,
                  pressMe: () {},
                  height: SizeConfig.screenHeight * 0.08,
                ),
              ),
              Expanded(
                child: ReusableRaisedButton(
                  text: "REJECT",
                  color: Colors.red,
                  pressMe: () {},
                  height: SizeConfig.screenHeight * 0.08,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReusableTitle extends StatelessWidget {
  final String title;

  ReusableTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ReusableText extends StatelessWidget {
  const ReusableText({@required this.text, this.padding});

  final String text;
  final padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[400],
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}
