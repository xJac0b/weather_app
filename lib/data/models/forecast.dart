import 'dart:convert';
import 'package:weather_app/data/models/weather.dart';

class Forecast {
  List<Weather> forecast;
  Forecast(this.forecast);
  factory Forecast.fromJson(json) {
    json = jsonDecode(json);
    List lista = json['list'];
    List<Weather> forecastTemp = [];
    for (var e in lista) {
      forecastTemp.add(Weather.fromJson(jsonEncode(e)));
    }
    return Forecast(forecastTemp);
  }
}
