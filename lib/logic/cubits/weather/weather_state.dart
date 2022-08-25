part of 'weather_cubit.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  final String? error;
  const WeatherInitial({this.error});
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  final Forecast forecast;
  final String? error;
  const WeatherLoaded(
      {required this.weather, required this.forecast, this.error});
}
