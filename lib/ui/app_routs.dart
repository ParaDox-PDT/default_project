import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/add_screen/add_screen.dart';
import 'package:n8_default_project/ui/my_contacts/my_contacts_screen.dart';
import 'package:n8_default_project/ui/profile/profile_screen.dart';

class RouteNames {
  static const String contacts = "/";
  static const String addContact = "/add_contact";
  static const String contactDetails = "/contact_details";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.contacts:
        return MaterialPageRoute(
            builder: (context) => const MyContactsScreen());
      case RouteNames.addContact:
        return MaterialPageRoute(builder: (context) =>  AddScreen(listener: settings.arguments as VoidCallback,));
      case RouteNames.contactDetails:
        return MaterialPageRoute(builder: (context) {
          Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
          return ProfileScreen(
            id: map["id"],
            deleteListener: map["deleteListener"],
            updateListener: map["updateListener"],
          );
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
