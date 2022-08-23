import 'package:flutter/material.dart';
import 'package:weather_app/ui/constants/colors.dart';

enum AppTheme { light, dark }

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(
      fontFamily: 'Montserrat',
      scaffoldBackgroundColor: Colors.blue[50],
      colorSchemeSeed: AppColors.seedColor,
      brightness: Brightness.light),
  AppTheme.dark: ThemeData(
      fontFamily: 'Montserrat',
      colorSchemeSeed: AppColors.seedColor,
      brightness: Brightness.dark),
};
