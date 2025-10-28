import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.white,
      splashColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black),
      centerTitle: true,
    ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.black20Medium,
        labelMedium: AppTextStyles.black14Medium,
        labelLarge: AppTextStyles.black16Bold,
      )
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.black,
      splashColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.white),
      centerTitle: true,
    ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.white20Medium,
        labelMedium: AppTextStyles.white14Medium,
        labelLarge: AppTextStyles.white16Bold,
      )
  );
}
