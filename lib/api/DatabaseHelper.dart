import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dark_store/api/SingletonDio.dart';

class DBHelper {
  Future<Response> registerUser(data, apiUrl) async {
    Response response =
        await SingletonDio().getAuthenticate(jsonEncode(data), apiUrl);
    return response;
  }

  Future<Response> loginUser(data, apiUrl) async {
    Response response =
        await SingletonDio().getAuthenticate(jsonEncode(data), apiUrl);
    return response;
  }

  Future<Response> emailAuth(data, apiUrl) async {
    Response response =
        await SingletonDio().getAuthenticate(jsonEncode(data), apiUrl);
    return response;
  }

  Future<Response> addProduct(data, apiUrl) async {
    Response response = await SingletonDio().getAuthenticate(data, apiUrl);
    return response;
  }

  Future<Response> fetchRecord(apiUrl) async {
    Response response = await SingletonDio().fetchRecord(apiUrl);
    return response;
  }

  Future<Response> removeProduct(data, apiUrl) async {
    Response response =
        await SingletonDio().getAuthenticate(jsonEncode(data), apiUrl);
    return response;
  }

  Future<Response> searchProduct(data, apiUrl) async {
    Response response =
        await SingletonDio().getAuthenticate(jsonEncode(data), apiUrl);
    return response;
  }

//  Future<Response> updateProduct(data, apiUrl) async {
//    Response response = await SingletonDio().getAuthenticate(data, apiUrl);
//    return response;
//  }
}
