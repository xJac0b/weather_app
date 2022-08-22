import 'dart:convert';

class Weather {
  double temp;
  Weather(this.temp);
  factory Weather.fromJson(json) => Weather(jsonDecode(json)['main']['temp']);
}
