part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  late double? temp;
  WeatherState({this.temp});
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  WeatherLoaded({required temp}) : super(temp: temp);
}
