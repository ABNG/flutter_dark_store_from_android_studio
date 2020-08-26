import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_dark_store/model/my_product.dart';

import 'DatabaseHelper.dart';

class Products {
  static List<MyProducts> _products = List<MyProducts>();

  static Future<List<MyProducts>> getAllProducts() async {
    _products.clear();
    Response response = await DBHelper().fetchRecord("fetchAll");
    for (Map<String, dynamic> data in response.data["response"]) {
      _products.add(MyProducts.fromJson(data));
    }
    return _products;
  }

  static Future<bool> removeProduct(int pid) async {
    Map<String, dynamic> data = {"pid": pid};
    Response response = await DBHelper().removeProduct(data, "removeProduct");
    bool _value = response.data["status"];
    return _value;
  }

  static Future<List<MyProducts>> searchProduct(String name) async {
    _products.clear();
    Map<String, dynamic> data = {"name": name};
    Response response = await DBHelper().searchProduct(data, "searchProduct");
    for (Map<String, dynamic> data in response.data["response"]) {
      _products.add(MyProducts.fromJson(data));
    }
    return _products;
  }

//  static Future<bool> updateProduct(result) async {
//    Response response = await DBHelper().updateProduct(result, "editProduct");
//    bool _value = response.data["status"];
//    return _value;
//  }
}
