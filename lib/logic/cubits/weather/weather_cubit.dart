import 'package:bloc/bloc.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/repos/weather_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(const WeatherInitial());

  Future<void> getWeather(String city) async {
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
