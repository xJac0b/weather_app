import 'dart:convert';

class Weather {
  int temp;
  String name;
  Weather(this.temp, this.name);
  factory Weather.fromJson(json, name) => Weather(
      (jsonDecode(json)['main']['temp'] - 273.15).round(),
      name[0].toUpperCase() + name.substring(1).toLowerCase());
}
