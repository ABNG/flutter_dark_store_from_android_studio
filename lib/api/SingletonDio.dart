import 'package:dio/dio.dart';

class SingletonDio {
  static final SingletonDio singletonDio = SingletonDio._internal();
  factory SingletonDio() => singletonDio;
  Dio _dio;
  static final String _url = "http://192.168.1.43:8000/api/";

  SingletonDio._internal() {
    _dio = Dio();
  }

  Future<Response> getAuthenticate(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await _dio.post(fullUrl, data: data);
  }

  Future<Response> fetchRecord(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await _dio.post(fullUrl);
  }
}
