
import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();
  
  dio.options.baseUrl = "http://3.3.2.200:8000/api";
  dio.options.headers['Accept'] = 'application/json';

  return dio;

}