import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/repos/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeather>((event, emit) async {
      emit(WeatherLoading());
      final WeatherRepository repo = WeatherRepository();
      final Weather weather = await repo.getWeatherByCityName(event.city);
      emit(WeatherLoaded(
          temp: num.parse((weather.temp - 273.15).toStringAsFixed(2))));
    });
  }
}
