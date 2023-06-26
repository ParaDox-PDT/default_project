import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/add_todo/add_todo_screen.dart';
import 'package:n8_default_project/ui/on_boarding/on_boarding_screen.dart';
import 'package:n8_default_project/ui/splash/splash_screen.dart';
import 'package:n8_default_project/ui/tabs/tabs_screen.dart';

import '../models/todo_model/todo_model.dart';

class RouteNames {
  static const String initial = "/";
  static const String boarding = "/boarding_route";
  static const String tabs = "/tabs_route";
  static const String addToDoScreen = "/add_todo_route";
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
      case RouteNames.addToDoScreen:
        return MaterialPageRoute(
          builder: (context) => AddToDoScreen(
            onAdded: settings.arguments as ValueChanged<ToDoModel>,
          ),
        );
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
