import 'package:flutter/material.dart';
import 'package:n8_default_project/models/app_model.dart';
import 'package:n8_default_project/ui/app_detail/app_detail_screen.dart';

import 'home/home_screen.dart';


class RouteNames {
  static const String homeScreen = "/";
  static const String appDetailsScreen = "/app_details";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
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