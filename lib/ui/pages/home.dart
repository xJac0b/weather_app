import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubits/city/city_cubit.dart';
import 'package:weather_app/logic/cubits/weather/weather_cubit.dart';
import 'package:weather_app/ui/widgets/app_bar.dart';
import 'package:weather_app/ui/widgets/city_input.dart';
import 'package:weather_app/ui/widgets/city_weather.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherCubit>(create: (context) => WeatherCubit()),
          BlocProvider<CityCubit>(create: (context) => CityCubit()),
        ],
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const CityInput(),
                      Text(state.error ?? '')
                    ],
                  ),
                ),
              );
            }
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      CityWeather(weather: state.weather),
                      const SizedBox(height: 12.0),
                      const CityInput(),
                      const SizedBox(height: 40),
                      Forecast5Days(forecast: state.forecast)
                    ],
                  ),
                ),
              );
            }
            return const Text("error");
          },
        ),
      ),
    );
  }
}
