import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/logic/cubits/internet/internet_cubit.dart';
import 'package:weather_app/ui/constants/theme.dart';
import 'package:weather_app/ui/pages/home.dart';

import 'logic/cubits/city/city_cubit.dart';
import 'logic/cubits/theme/theme_cubit.dart';
import 'logic/cubits/weather/weather_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
      connectivity: Connectivity(),
      sharedPreferences: await SharedPreferences.getInstance()));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  final SharedPreferences sharedPreferences;
  const MyApp(
      {Key? key, required this.connectivity, required this.sharedPreferences})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(sharedPreferences),
        ),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(
          create: (context) =>
              WeatherCubit(BlocProvider.of<InternetCubit>(context)),
        ),
        BlocProvider<CityCubit>(create: (context) => CityCubit()),
      ],
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
