import 'package:dio/dio.dart';

abstract class ApiConfig {
  ApiConfig._();

  static const String baseUrl = "https://randomuser.me/api/";
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const ResponseType responseType = ResponseType.json;

  static const String userAPI = '?results=100';

  //
  // static const String email = 'email';
  // static const String password = 'password';
  // static const String deviceType = 'device_type';
  // static const String deviceToken = 'device_token';
  // static const String mobileNo = 'mobile_no';
  // static const String firstName = 'first_name';
  // static const String lastName = 'last_name';
  // static const String countryCode = 'country_code';
  // static const String login = 'login';
}
