import 'package:demo_app/view/home/home_binding.dart';
import 'package:demo_app/view/home/home_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_route.dart';

class AppPages {
  AppPages._();

  static const initialRoute = Routes.homeScreenRoute;
  static final pages = [
    GetPage(
      name: Routes.homeScreenRoute,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: Routes.homeScreenRoute,
    //   page: () => HomeScreen(),
    //   // binding:
    // ),
  ];
}
