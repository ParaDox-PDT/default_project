import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/app_routs.dart';

import 'data/local/storage_repo/storage_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:RouteNames.contacts,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
