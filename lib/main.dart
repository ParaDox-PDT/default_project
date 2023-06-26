import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n8_default_project/ui/router.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/theme.dart';

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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          themeMode: ThemeMode.dark,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: RouteNames.initial,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
