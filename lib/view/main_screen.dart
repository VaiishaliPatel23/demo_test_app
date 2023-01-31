import 'package:demo_app/res/color_config.dart';
import 'package:demo_app/res/string_config.dart';
import 'package:demo_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.initialRoute,
      debugShowCheckedModeBanner: false,
      title: StringConfig.appTitle,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: ColorConfig.colorPrimarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        primaryColor: ColorConfig.colorPrimary,
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: StringConfig.appFont,
      ),
    );
  }
}
