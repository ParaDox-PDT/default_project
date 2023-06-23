import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/on_boarding/on_boarding_screen.dart';
import 'package:n8_default_project/ui/splash/splash_screen.dart';
import 'package:n8_default_project/ui/tabs/tabs_screen.dart';

class RouteNames {
  static const String initial = "/";
  static const String boarding = "/boarding_route";
  static const String tabs = "/tabs_route";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.initial:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteNames.boarding:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case RouteNames.tabs:
        return MaterialPageRoute(builder: (context) => TabsScreen());
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
