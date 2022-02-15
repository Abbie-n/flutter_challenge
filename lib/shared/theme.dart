import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/shared.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'DM Sans',
    scaffoldBackgroundColor: AppColors.primaryColor,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.neutrals,
    ),
  );
}
