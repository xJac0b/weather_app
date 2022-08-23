part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final Forecast? weather;
  final String? error;
  const WeatherState({this.weather, this.error});
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial({error}) : super(error: error);
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded({required weather}) : super(weather: weather);
}
