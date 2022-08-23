import 'package:weather_app/data/data_providers/weather_api.dart';
import 'package:weather_app/data/models/weather.dart';

class WeatherRepository {
  final WeatherAPI api = WeatherAPI();
  Future<Forecast> getWeatherByCityName(String name) async {
    final String rawWeather = await api.getRawWeather(name);
    print(rawWeather);
    final Forecast weather = Forecast.fromJson(rawWeather);
    return weather;
  }
}
