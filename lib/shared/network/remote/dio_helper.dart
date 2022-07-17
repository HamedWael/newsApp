import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static var dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        validateStatus: (_)=>true,
      ),
    );
  }

  static Future<Response> getData({required String url, required Map<String, dynamic> query,}
    ) async {
    return await dio.get(url, options: Options(headers: {"Content-Type":"application/json"})
    );
  }


}

