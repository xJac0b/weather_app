import 'package:flutter/material.dart';
import 'package:weather_app/ui/constants/colors.dart';

enum AppTheme { light, dark }

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(
      scaffoldBackgroundColor: Colors.blue[100],
      colorSchemeSeed: AppColors.seedColor,
      brightness: Brightness.light),
  AppTheme.dark: ThemeData(
      colorSchemeSeed: AppColors.seedColor, brightness: Brightness.dark),
};
