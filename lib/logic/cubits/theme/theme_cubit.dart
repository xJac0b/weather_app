import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  SharedPreferences sharedPreferences;
  ThemeCubit(this.sharedPreferences)
      : super(ThemeState(themeMode: ThemeMode.light)) {
    bool light = sharedPreferences.getBool('lightTheme') ?? true;
    if (!light) {
      emit(ThemeState(themeMode: ThemeMode.dark));
    }
  }

  Future<void> updateAppTheme() async {
    state.themeMode == ThemeMode.light
        ? emit(ThemeState(themeMode: ThemeMode.dark))
        : emit(ThemeState(themeMode: ThemeMode.light));
    sharedPreferences.setBool('lightTheme', state.themeMode == ThemeMode.light);
  }
}
