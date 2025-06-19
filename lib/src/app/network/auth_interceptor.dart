import 'dart:io';
import 'package:dio/dio.dart';

import '../core/storage/get_storage_helper.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final boxStorage = GetStorageHelper();
    final token = boxStorage.getString(GetStorageHelper.token);
    if (token != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      print('token111111 $token');
    }
    handler.next(options);
  }
}
