import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/ui/constants/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light));

  Future<void> updateAppTheme() async {
    state.themeMode == ThemeMode.light
        ? emit(ThemeState(themeMode: ThemeMode.dark))
        : emit(ThemeState(themeMode: ThemeMode.light));
  }
}
