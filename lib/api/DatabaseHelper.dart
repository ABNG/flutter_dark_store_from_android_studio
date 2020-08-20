import 'dart:convert';
import 'package:dio/dio.dart';

class DBHelper {
  final String _url = 'http://127.0.0.1:8000/api/';

  Future<Response> registerUser(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    Response response = await Dio().post(fullUrl, data: jsonEncode(data));
    return response;
  }

  Future<Response> loginUser(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    Response response = await Dio().post(fullUrl, data: jsonEncode(data));
    return response;
  }

  Future<Response> emailAuth(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    Response response = await Dio().post(fullUrl, data: jsonEncode(data));
    return response;
  }
}
