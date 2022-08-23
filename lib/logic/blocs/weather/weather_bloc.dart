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
      try {
        final WeatherRepository repo = WeatherRepository();
        final Forecast weather = await repo.getWeatherByCityName(event.city);
        emit(WeatherLoaded(weather: weather));
      } catch (e) {
        emit(const WeatherInitial(error: "City not found!"));
      }
    });
  }
}
