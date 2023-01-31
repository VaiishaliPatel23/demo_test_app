import 'dart:convert';

import 'package:demo_app/models/user.dart';
import 'package:demo_app/res/api_config.dart';
import 'package:demo_app/utils/common_methods.dart';
import 'package:dio/dio.dart';

import 'dio_exception.dart';

class ApiController {
  late Response response;
  var dio = Dio();

  // Get user data from network
  Future<User> getUserInfo() async {
    try {
      Response response = await dio.get(
        ApiConfig.baseUrl + ApiConfig.userAPI,
      );
      if (response.statusCode == 200) {
        User res = userFromJson(json.encode(response.data));
        return res;
      } else {
        return  User();
      }
    } on DioError catch (e) {
      CommonMethods.showSnackBarError(DioExceptions.fromDioError(e).toString());
      return  User();
    }
  }
}
