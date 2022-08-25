import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/repos/weather_repo.dart';
import 'package:weather_app/logic/cubits/internet/internet_cubit.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final InternetCubit internetCubit;
  WeatherCubit(this.internetCubit) : super(const WeatherInitial());

  Future<void> getWeather(String city) async {
    if (internetCubit.state is InternetDisconnected) {
      emit(const WeatherInitial(error: "No internet Connection!"));
    } else {
      emit(WeatherLoading());
      try {
        final WeatherRepository repo = WeatherRepository();
        final Weather weather = await repo.getWeatherByCityName(city);
        final Forecast forecast = await repo.get5DayForecastByCityName(city);
        emit(WeatherLoaded(weather: weather, forecast: forecast));
      } catch (e) {
        emit(const WeatherInitial(error: "City not found!"));
      }
    }
  }
}
