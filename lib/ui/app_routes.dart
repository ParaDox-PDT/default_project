import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/app_detail/app_detail_screen.dart';
import 'package:n8_default_project/ui/tab_box/tab_box_screen.dart';

import 'home/home_screen.dart';


class RouteNames {
  static const String tabBox = "/";
  static const String homeScreen = "/home_screen";
  static const String appDetailsScreen = "/app_details";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.tabBox:
        return MaterialPageRoute(
            builder: (context) => const TabBoxScreen());
      case RouteNames.homeScreen:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen());
      case RouteNames.appDetailsScreen:
        return MaterialPageRoute(builder: (context){
          Map<String,dynamic> map= settings.arguments as Map<String,dynamic>;
          return AppDetailsScreen(app: map["app"]);
        });
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}