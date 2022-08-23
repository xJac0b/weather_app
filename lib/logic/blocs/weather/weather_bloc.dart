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
        final Weather weather = await repo.getWeatherByCityName(event.city);
        final Forecast forecast =
            await repo.get5DayForecastByCityName(event.city);
        emit(WeatherLoaded(weather: weather, forecast: forecast));
      } catch (e) {
        print(e);
        emit(const WeatherInitial(error: "City not found!"));
      }
    });
  }
}
