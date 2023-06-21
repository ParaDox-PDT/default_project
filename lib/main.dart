import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/ui/home/home_screen.dart';
import 'package:n8_default_project/ui/home/splash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageRepository.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.white),
        useMaterial3: false,
      ),
      home: SplashScreen()
    );
    }
}