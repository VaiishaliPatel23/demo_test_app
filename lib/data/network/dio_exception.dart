import 'package:demo_app/res/string_config.dart';
import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = StringConfig.requestCancelled;
        break;
      case DioErrorType.connectTimeout:
        message = StringConfig.connectionTimeout;
        break;
      case DioErrorType.receiveTimeout:
        message = StringConfig.receiveTimeout;
        break;
      case DioErrorType.response:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = StringConfig.sendTimeout;
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = StringConfig.noInternetError;
          break;
        }
        message = StringConfig.unexpectedError;
        break;
      default:
        message = StringConfig.responseError;
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return StringConfig.responseError;
    }
  }

  @override
  String toString() => message;
}
