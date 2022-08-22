import 'package:flutter/material.dart';
import 'package:weather_app/ui/constants/colors.dart';

enum AppTheme { light, dark }

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primaryLight, secondary: AppColors.accent)),
  AppTheme.dark: ThemeData(
      colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColors.primaryLight, secondary: AppColors.accent)),
};
