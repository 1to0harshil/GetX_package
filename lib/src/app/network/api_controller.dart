// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gn;
import 'package:get/get.dart';
import 'package:get_x_structure/src/app/core/constants/app_label.dart';
import 'package:get_x_structure/src/app/core/constants/enums.dart';
import 'package:get_x_structure/src/app/core/constants/urls.dart';
import 'package:get_x_structure/src/app/core/storage/get_storage_helper.dart';
import 'package:get_x_structure/src/app/data/model/error_model.dart';
import 'package:get_x_structure/src/app/network/auth_interceptor.dart';
import 'package:get_x_structure/src/app/routes/app_pages.dart';
import 'package:get_x_structure/src/app/utils/print_log/print_log.dart';
import 'package:get_x_structure/src/app/widget/dialog/custom_alert_widget.dart';

import '../core/error/failures.dart';

import '../core/theme/theme_helper.dart';

abstract class _BaseApiController {
  late Dio _dio;
  final GlobalKey key = GlobalKey();

  Future<void> init({required ApiVersion version}) async {
    final dioOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 60000),
      baseUrl: URLs.baseURL,
      contentType: Headers.jsonContentType,
      validateStatus: (status) {
        if (status == 401) {
          return false;
        } else {
          return true;
        }
      },
      headers: {
        HttpHeaders.acceptHeader: Headers.jsonContentType,
      },
    );

    _dio = Dio(dioOptions);

    _setupInterceptors();
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  void _setupInterceptors() {
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }
    // Add Auth Interceptor
    _dio.interceptors.add(AuthInterceptor());
  }

  ErrorResponse _handleError(DioException error) {
    var errorResponse = ErrorResponse();

    final boxStorage = GetStorageHelper();
    PrintLog.printTagData('ERRORFirst', error.type);
    if (error.response?.statusCode == 401) {
      if (key.currentWidget == null) {
        showGeneralDialog(
          barrierColor: Colors.black.withValues(alpha:0.5),
          transitionBuilder: (context, a1, a2, widget) => Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: WillPopScope(
                onWillPop: () async {
                  boxStorage.clearWholeApp();
                  await Get.offAllNamed(Routes.LOGIN);
                  return false;
                },
                child: CustomAlertDialog(
                    globalKey: key,
                    title: 'Your session has expired. Please login again',
                    btnString: 'Log In',
                    forceDialog: true,
                    onTap: () {
                      boxStorage.clearWholeApp();
                      Get.offAllNamed(Routes.LOGIN);
                    },),
              ),
            ),
          ),
          transitionDuration: const Duration(milliseconds: 200),
          barrierDismissible: false,
          barrierLabel: '',
          context: Get.context!,
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation,) =>
              const SizedBox(),
        );
      }
    }

    if (error.type == DioExceptionType.unknown &&
        error.error != null &&
        error.error is SocketException) {
      errorResponse =
          ErrorResponse(error: Error(detail: 'No Internet Connection'));
    }

    switch (error.type) {
      case DioExceptionType.cancel:
        errorResponse = ErrorResponse(
          error: Error(detail: AppLabel.somethingWentWrong),
        );
        break;
      case DioExceptionType.badResponse:
        if (error.response?.data != null) {
          try {
            errorResponse = ErrorResponse.fromJson(error.response!.data);
          } catch (e) {
            errorResponse = ErrorResponse(
                error: Error(detail: AppLabel.somethingWentWrong),);
          }
        } else {
          errorResponse =
              ErrorResponse(error: Error(detail: AppLabel.somethingWentWrong));
        }
        break;
      case DioExceptionType.connectionTimeout:
        PrintLog.printTagData('INSIDE', error.type);
        _serverTimeOutDialog();
        errorResponse =
            ErrorResponse(error: Error(detail: AppLabel.serverTimeout));
        break;
      case DioExceptionType.receiveTimeout:
        _serverTimeOutDialog();
        errorResponse =
            ErrorResponse(error: Error(detail: AppLabel.serverTimeout));
        break;
      case DioExceptionType.sendTimeout:
        _serverTimeOutDialog();
        errorResponse =
            ErrorResponse(error: Error(detail: AppLabel.serverTimeout));
        break;
      case DioExceptionType.unknown:
        _serverTimeOutDialog(title: AppLabel.somethingWentWrong);
        errorResponse =
            ErrorResponse(error: Error(detail: AppLabel.noInternet));
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.connectionError:
        PrintLog.printData('Network');
        _serverTimeOutDialog(title: 'Connection Error');
        break;
    }
    return errorResponse;
  }

  bool _isServerTimeOutDialog = false;

  void _serverTimeOutDialog({String title = 'Server Connection Timeout'}) {
    if (!_isServerTimeOutDialog) {
      _isServerTimeOutDialog = true;
      showGeneralDialog(
        barrierColor: appTheme.gray50.withValues(alpha:0.5),
        transitionBuilder: (context, a1, a2, widget) => Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: CustomAlertDialog(
              title: title,
              btnString: 'Okay',
              forceDialog: true,
              onTap: () {
                _isServerTimeOutDialog = false;
                gn.Get.back();
                //gn.Get.back();
              },
            ),
          ),
        ),
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierLabel: '',
        context: Get.context!,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SizedBox(),
      );
    }
  }

  // GET
  Future<Either<Failure, Map<String, dynamic>>> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final response = await _dio.get(
          path,
          queryParameters: query,
        );
        return Right(response.data);
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          return Left(SessionFailure());
        } else {
          _handleError(e);
          return Left(ApiFailure());
        }
      }
    } else {
      noInternetDialog();
      return Left(ApiFailure());
    }
  }

  // POST
  Future<Either<Failure, Map<String, dynamic>>> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final response = await _dio.post(
          path,
          data: data,
          queryParameters: query,
        );
        return Right(response.data);
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          return Left(SessionFailure());
        } else {
          _handleError(e);
          return Left(ApiFailure());
        }
      }
    } else {
      noInternetDialog();
      return Left(ApiFailure());
    }
  }

  // PUT
  Future<Either<Failure, Map<String, dynamic>>> put({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final response = await _dio.put(
          path,
          data: data,
          queryParameters: query,
        );
        return Right(response.data);
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          return Left(SessionFailure());
        } else {
          _handleError(e);
          return Left(ApiFailure());
        }
      }
    } else {
      noInternetDialog();
      return Left(ApiFailure());
    }
  }

  // PATCH
  Future<Either<Failure, Map<String, dynamic>?>> delete({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final response = await _dio.delete(
          path,
          data: data,
          queryParameters: query,
        );
        return Right(response.data);
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          return Left(SessionFailure());
        } else {
          _handleError(e);
          return Left(ApiFailure());
        }
      }
    } else {
      noInternetDialog();
      return Left(ApiFailure());
    }
  }

  void noInternetDialog() {
    showGeneralDialog(
      barrierColor: theme.primaryColor.withValues(alpha:0.5),
      transitionBuilder: (context, a1, a2, widget) => Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: CustomAlertDialog(
            title: 'No Internet connection',
            btnString: 'Okay',
            forceDialog: true,
            onTap: () {
              gn.Get.back();
            },
          ),
        ),
      ),
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: false,
      barrierLabel: '',
      context: Get.context!,
      pageBuilder: (
        context,
        animation,
        secondaryAnimation,
      ) =>
          const SizedBox(),
    );
  }
}

class ApiControllerV1 extends _BaseApiController {
  ApiControllerV1() {
    super.init(version: ApiVersion.v1);
  }
}
