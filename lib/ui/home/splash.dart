import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/home/home_screen.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _navigateToWelcomeScreen(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Center(
        child: Text("My Last App",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.black),),
      ),
    );
  }

  void _navigateToWelcomeScreen(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return  const HomeScreen();
          },
        ),
      );
    });
  }
}