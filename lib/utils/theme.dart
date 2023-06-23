import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8_default_project/utils/colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.C_121212,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.C_121212,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.C_121212,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.C_121212),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
  );
}
