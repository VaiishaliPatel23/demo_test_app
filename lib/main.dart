import 'package:demo_app/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// global variable for local storage
late SharedPreferences localStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ↑ Req'd for using SharedPrefs (MethodChannel operations) prior to runApp
  localStorage = await SharedPreferences.getInstance();
  runApp(const MainScreen());
}
