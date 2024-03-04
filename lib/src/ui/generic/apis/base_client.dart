import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../configs/app_config.dart';
import '../../configs/application_platforms.dart';
import '../context/app_context.dart';
import '../helper_functions/loader_service.dart';
import '../helper_functions/response_popup_service.dart';
import '../message_indicators/snackbar.dart';
import 'api_exceptions.dart';
import 'api_response_model.dart';
import 'api_strings.dart';

enum RequestType {
  get,
  post,
  put,
  delete,
}

enum LogType { mini, extended, none }

var log = Logger(
  printer: PrettyPrinter(),
);

class BaseClient {
  static Future<Map<String, dynamic>> generateHeaders({
    String? contentType,
    String? bearerAuthorizationToken,
    String? token,
    int? userId,
    int? storeId,
  }) async {
    final Map<String, dynamic> headers = {
      'Content-Type': contentType ?? 'application/json',
      'Accept': 'application/json',
      'Connection': 'keep-alive',
      if (bearerAuthorizationToken != null)
        'Authorization': 'Bearer $bearerAuthorizationToken',
      if (token != null) 'Token': token,
      if (userId != null) 'UserId': userId,
      if (storeId != null) 'StoreId': storeId,
    };
    return headers;
  }

  static final Dio _dioWithInterceptor = Dio()
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );

  static final Dio _dioWithOutInterceptor = Dio();

  static late Dio _dio;

  // request request
  static Future<dynamic> safeApiCall(
    String url,
    RequestType requestType, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
    // while sending (uploading) progress
    Function(int total, int progress)? onSendProgress,
    Function? onLoading,
    dynamic data,
    LogType logType = LogType.none,
  }) async {
    try {
      if (logType == LogType.extended) {
        _dio = _dioWithInterceptor;
      } else {
        _dio = _dioWithOutInterceptor;
      }
      // 1) indicate loading state
      await onLoading?.call();
      // 2) try to perform http request
      late Response response;

      DateTime? start, end;

      // Prints Api Execution Time
      if (logType != LogType.none) {
        start = DateTime.now();
      }

      if (requestType == RequestType.get) {
        response = await _dio.get(
          url,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers ?? await generateHeaders()),
        );
      } else if (requestType == RequestType.post) {
        response = await _dio.post(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers ?? await generateHeaders()),
        );
      } else if (requestType == RequestType.put) {
        response = await _dio.put(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers ?? await generateHeaders()),
        );
      } else {
        response = await _dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers ?? await generateHeaders()),
        );
      }
      // 3) return response (api done successfully)

      // Prints Api Execution Time
      if (logType != LogType.none) {
        end = DateTime.now();
        log.f(
          'URL: $url\nCURRENT_TIME: ${DateFormat.yMMMd().add_jms().format(DateTime.now())} ,'
          ' API_TIME: ${end.difference(start!).inMilliseconds / 1000} s.',
        );
      }

      return await onSuccess(response);
    } on DioException catch (error) {
      // Prints Api Error
      if (logType != LogType.none) {
        log.e(error);
      }

      _handleDioError(error: error, url: url, onError: onError);
    } on SocketException {
      // No internet connection
      _handleSocketException(url: url, onError: onError);
    } on TimeoutException {
      // Api call went out of time
      _handleTimeoutException(url: url, onError: onError);
    } catch (error) {
      // Prints Api Error
      if (logType != LogType.none) {
        log.e(error);
      }

      // unexpected error for example (parsing json error)
      _handleUnexpectedException(url: url, onError: onError, error: error);
    }
  }

  // POST : To Generate MultiPart Data from Data and Files
  static dynamic getMultiPartData({
    Map<String, dynamic>? data,
    Map<String, XFile>? files,
  }) async {
    try {
      FormData formData = FormData();

      // If Data isNotNull create FormData
      if (data != null) {
        formData = FormData.fromMap(data);
      }

      // If Files isNotNull add files in FormData
      if (files != null && files.isNotEmpty) {
        for (final MapEntry<String, XFile> file in files.entries) {
          formData.files.add(
            MapEntry(
              file.key,
              AppConfig.getAppPlatform() == ApplicationPlatforms.WEB
                  ? MultipartFile.fromBytes(
                      await file.value.readAsBytes(),
                      filename: file.value.name,
                    )
                  : MultipartFile.fromFileSync(file.value.path),
            ),
          );
        }
      }

      return formData;
    } catch (e) {
      log.e(e);
    }
  }

  /// download file
  static Future<void> download({
    required String url, // file url
    required String savePath, // where to save file
    Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
    required Function onSuccess,
  }) async {
    try {
      await _dio.download(
        url,
        savePath,
        options: Options(
          receiveTimeout: const Duration(seconds: 999999),
          sendTimeout: const Duration(seconds: 999999),
        ),
        onReceiveProgress: onReceiveProgress,
      );
      onSuccess();
    } catch (error) {
      final exception = ApiException(url: url, message: error.toString());
      onError?.call(exception) ?? _handleError(error.toString());
    }
  }

  /// handle unexpected error
  static void _handleUnexpectedException({
    Function(ApiException)? onError,
    required String url,
    required Object error,
  }) {
    if (onError != null) {
      onError(ApiException(message: error.toString(), url: url));
    } else {
      _handleError(error.toString());
    }
  }

  /// handle timeout exception
  static void _handleTimeoutException({
    Function(ApiException)? onError,
    required String url,
  }) {
    if (onError != null) {
      onError(
        ApiException(
          message: ApiStrings.SERVERNOTRESPONDING,
          url: url,
        ),
      );
    } else {
      _handleError(
        ApiStrings.SERVERNOTRESPONDING,
      );
    }
  }

  /// handle socket exception
  static void _handleSocketException({
    Function(ApiException)? onError,
    required String url,
  }) {
    if (onError != null) {
      onError(
        ApiException(
          message: ApiStrings.NOINTERNETCONNECTION,
          url: url,
        ),
      );
    } else {
      _handleError(
        ApiStrings.NOINTERNETCONNECTION,
      );
    }
  }

  /// handle Dio error
  static Future _handleDioError({
    required DioException error,
    Function(ApiException)? onError,
    required String url,
  }) async {
    // log.w(error.error);
    debugPrint(error.response?.statusCode.toString());
    if (error.response?.statusCode == 403 ||
        error.error.toString().contains(
              "SocketException: Failed host lookup: 'cronyprotest.azurewebsites.net'",
            )) {
      final exception = ApiException(
        message: 'Server Unavailable, Please try again.',
        url: url,
        statusCode: 403,
      );

      if (onError != null) {
        return onError(exception);
      } else {
        return handleApiError(exception);
      }
    }

    if (error.response?.statusCode == 419) {
      LoaderService.setContextSafeLoader(
        startLoader: false,
        loaderKeyForBloc: 'all',
      );
      ResponsePopUpService.showVerificationFailedPopUp(
        message: 'You have been kicked out of session or token expired',
        buttonText: 'Logout',
        buttonFunction: () {
          // UserBlocHelper.logout(
          //   appContext.getContext()!,
          // );
        },
      );
    }

    // no internet connection
    if ((error.message ?? '').toLowerCase().contains('socket') ||
        error.type == DioExceptionType.connectionError ||
        error.error is SocketException) {
      if (onError != null) {
        return onError(
          ApiException(message: ApiStrings.NOINTERNETCONNECTION, url: url),
        );
      } else {
        return _handleError(ApiStrings.NOINTERNETCONNECTION);
      }
    }

    // check if the error is 500 (server problem)
    if (error.response?.statusCode == 500) {
      final exception = ApiException(
        message: ApiStrings.SERVERERROR,
        url: url,
        statusCode: 500,
      );

      if (onError != null) {
        return onError(exception);
      } else {
        return handleApiError(exception);
      }
    }

    final exception = ApiException(
      url: url,
      // TODO : Fix to show relevant messages
      message: error.message ?? ApiStrings.SOMETHINGWENTWRONG,
      response: error.response,
      statusCode: error.response?.statusCode,
    );
    if (onError != null) {
      return onError(exception);
    } else {
      return handleApiError(exception);
    }
  }

  /// handle error automatically (if user didn't pass onError) method
  /// it will try to show the message from api if there is no message
  /// from api it will show the reason
  static void handleApiError(ApiException apiException) {
    // final String msg = apiException.toString();
    appContext.runContextSafeFunction(() {
      // CustomSnackBar.snackBarTrigger(
      //   context: appContext.getContext()!,
      //   message: msg,
      // );
    });
  }

  /// handle errors without response (500, out of time, no internet,..etc)
  static void _handleError(String msg) {
    appContext.runContextSafeFunction(() {
      CustomSnackBar.snackBarTrigger(
        context: appContext.getContext()!,
        message: msg,
      );
    });
  }
}

extension ConvertResponseX on Response {
  dynamic successContent() {
    final ApiResponse response = ApiResponse.fromJson(data);
    if (response.isSuccess) {
      return ApiResponse.fromJson(data).successContents;
    } else {
      if (response.failReason is String) {
        appContext.runContextSafeFunction(() {
          CustomSnackBar.snackBarTrigger(
            context: appContext.getContext()!,
            message: ApiStrings.SOMETHINGWENTWRONG,
            // message: response.failReason ?? '',
          );
        });
      } else {
        appContext.runContextSafeFunction(() {
          CustomSnackBar.snackBarTrigger(
            context: appContext.getContext()!,
            message: ApiStrings.SOMETHINGWENTWRONG,
          );
        });
      }
    }
  }

  // TODO : Implement Loading Progress Function
  // void showProgress(received, total) {
  //   if (total != -1) {
  //     log.e((received / total * 100).toStringAsFixed(0) + '%');
  //   }
  // }
  //
  // void onSendProgress(received, total) {
  //   if (total != -1) {
  //     log.e('${(received / total * 100).toStringAsFixed(0)}%');
  //   }
  // }
}
