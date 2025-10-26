import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black),
      centerTitle: true,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.white),
      centerTitle: true,
    ),
  );
}
