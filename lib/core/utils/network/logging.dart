import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

class Logging extends Interceptor {
  @override
  // ignore: unnecessary_overrides
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // debugPrint(
    //     'METHOD[${options.method}] => PATH: ${options.uri}\nREQUEST: ${options.data} ');
    return super.onRequest(options, handler);
  }

  @override
  // ignore: unnecessary_overrides
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // debugPrint(
    //   'RESPONSE[${response.statusCode}] => DATA: ${response.data}',
    // );
    return super.onResponse(response, handler);
  }

  @override
  // ignore: unnecessary_overrides
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // debugPrint(
    //   'ERROR[${err.response?.statusCode}] => MESSAGE: ${err.message}',
    // );
    return super.onError(err, handler);
  }
}
