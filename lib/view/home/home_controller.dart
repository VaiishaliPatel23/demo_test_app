import 'dart:convert';
import 'dart:io';

import 'package:demo_app/data/network/api_controller.dart';
import 'package:demo_app/main.dart';
import 'package:demo_app/models/user.dart';
import 'package:demo_app/res/storage_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // For network request
  late final ApiController _apiController;

  // Show user list  from network
  RxList<Results> usersList = <Results>[].obs;

  // Show user list  from local database
  RxList<Results> localUsersData = <Results>[].obs;

  // For show loader until data fetch
  final Rx<bool> _isLoading = false.obs;

  Rx<bool> get isLoading => _isLoading;

  // check internet connection
  Rx<bool> isNetworkAvailable = false.obs;

  @override
  void onInit() {
    getNetworkAvailability();

    getUserDataFromLocal();
    if (isNetworkAvailable.value) {
      _apiController = ApiController();
      getUserDataFromNetwork();
    }

    super.onInit();
  }

  void getNetworkAvailability() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (kDebugMode) {
        print('Is network ----$result');
      }
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isNetworkAvailable = true.obs;
      }
    } on SocketException catch (_) {
      if (kDebugMode) {
        print('Not connected');
      }
    }
  }

  // Get data from network
  void getUserDataFromNetwork() {
    _isLoading.value = true;
    _apiController.getUserInfo().then((response) {
      usersList.value = response.results ?? [];

      // Store data i local storage
      String str = json.encode(response);
      localStorage.setString(StorageConfig.getUserData, str);

      _isLoading.value = false;
    });
  }

  // Get data from local Storage
  void getUserDataFromLocal() {
    // Get user data from storage
    var str = localStorage.getString(StorageConfig.getUserData) ?? '{}';
    User data = userFromJson(str);
    List<Results> userData = data.results ?? [];
    //
    localUsersData.value = userData;
  }
}
