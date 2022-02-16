import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/utils/constants.dart';
import 'package:flutter_challenge/core/utils/network/logging.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

  Future<Response<dynamic>?> get({Map<String, dynamic>? params}) async {
    try {
      final res = await _dio.get(
        '',
        queryParameters: params ?? {},
      );
      if (res.statusCode! == 200) {
        return res;
      } else {
        return null;
      }
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return e.response!;
    }
  }
}
