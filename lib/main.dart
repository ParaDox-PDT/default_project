import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:n8_default_project/ui/app_routes.dart';

import 'data/local/service/hive_service.dart';
import 'data/models/app_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AppModelAdapter());
  await HiveService.openBox();

  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      initialRoute: RouteNames.tabBox ,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

