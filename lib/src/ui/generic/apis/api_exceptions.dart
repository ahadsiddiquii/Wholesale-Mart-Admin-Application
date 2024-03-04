import 'package:dio/dio.dart';

import 'api_strings.dart';

class ApiException implements Exception {
  ApiException({
    required this.url,
    required this.message,
    this.response,
    this.statusCode,
  });
  final String url;
  final String message;
  final int? statusCode;
  final Response<dynamic>? response;

  /// IMPORTANT NOTE
  /// here you can take advantage of toString() method to display the error for user
  /// lets make an example
  /// so in onError method when you make api you can just user apiExceptionInstance.toString() to get the error message from api
  @override
  String toString() {
    String result = '';
    // if server sent error message take it
    if (response != null) {
      try {
        //error message field which is coming from api for you (For ex: response.data['error']['message']
        result += response?.data['message'] ??
            response?.data['failReason'] ??
            response?.data['failReason']['message'];
      } catch (_) {}
    } else {
      result +=
          ' $message'; // message is the (dio error message) so usually its not user friendly
    }
    return result.isNotEmpty ? result : ApiStrings.SOMETHINGWENTWRONG;
  }
}
