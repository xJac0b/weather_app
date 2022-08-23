import 'package:weather_app/data/data_providers/weather_api.dart';
import 'package:weather_app/data/models/weather.dart';

class WeatherRepository {
  final WeatherAPI api = WeatherAPI();
  Future<Weather> getWeatherByCityName(String name) async {
    final String rawWeather = await api.getRawWeather(name);
    print(rawWeather);
    final Weather weather = Weather.fromJson(rawWeather);
    return weather;
  }

  Future<Forecast> get5DayForecastByCityName(String name) async {
    final String rawForecast = await api.getRaw5DayForecast(name);
    print(rawForecast);
    final Forecast forecast = Forecast.fromJson(rawForecast);
    return forecast;
  }
}
