import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/router.dart';

import '../../data/local/storage_repo/storage_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 3));
    bool isFirst = StorageRepository.getBool("is_first");
    if (context.mounted) {
      Navigator.pushReplacementNamed(
        context,
        isFirst ? RouteNames.tabs : RouteNames.boarding,
      );
    }
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
        child: Text("Spalsh Screen"),
      ),
    );
  }
}
