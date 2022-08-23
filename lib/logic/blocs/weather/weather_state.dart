part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final Weather? weather;
  final Forecast? forecast;
  final String? error;
  const WeatherState({this.weather, this.forecast, this.error});
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial({error}) : super(error: error);
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded({required weather, required forecast})
      : super(weather: weather, forecast: forecast);
}
