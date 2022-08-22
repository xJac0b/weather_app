import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubits/theme/theme_cubit.dart';

AppBar appBar = AppBar(
  actions: <Widget>[
    BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) => IconButton(
          icon: Icon(
            state.themeMode == ThemeMode.light ? Icons.sunny : Icons.mode_night,
            color: Colors.white,
          ),
          onPressed: BlocProvider.of<ThemeCubit>(context).updateAppTheme),
    )
  ],
  title: const Text('Weather Better'),
);
