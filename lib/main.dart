import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/constants/theme.dart';
import 'package:weather_app/ui/pages/home.dart';

import 'logic/cubits/theme/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Weather Better',
              theme: appThemeData[AppTheme.light],
              darkTheme: appThemeData[AppTheme.dark],
              themeMode: state.themeMode,
              home: const Home());
        },
      ),
    );
  }
}
