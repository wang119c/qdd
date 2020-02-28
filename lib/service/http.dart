import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class Http {
  static Future get(url, {queryParameters}) async {
    try {
      Response response;
      Dio dio = Dio();
      dio.options.contentType = 'application/x-www-form-urlencoded';
//    dio.options.headers = {
//
//    };
      response = await dio.get(url, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("接口出现问题");
      }
    } catch (e) {
      return print("error");
    }
  }
}
