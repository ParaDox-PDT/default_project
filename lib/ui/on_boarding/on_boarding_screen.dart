import 'package:flutter/material.dart';
import 'package:n8_default_project/data/storage_repo/storage_repository.dart';
import 'package:n8_default_project/ui/router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 1));
    await StorageRepository.putBool("is_first", true);
    Navigator.pushReplacementNamed(context, RouteNames.tabs);
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Boarding Screen"),
      ),
    );
  }
}
