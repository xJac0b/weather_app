part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  int? temp;
  String? name;
  WeatherState({this.temp, this.name});
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  WeatherLoaded({required temp, required name}) : super(temp: temp, name: name);
}
