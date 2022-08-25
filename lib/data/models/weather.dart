import 'dart:convert';

class Weather {
  int temp, dt;
  String name, icon, desc;
  Weather(this.temp, this.icon, this.desc, this.dt, this.name);

  factory Weather.fromJson(json) {
    json = jsonDecode(json);
    return Weather(
        (json['main']['temp']).round(),
        // ignore: prefer_interpolation_to_compose_strings
        "https://openweathermap.org/img/wn/" +
            json['weather'][0]['icon'] +
            "@2x.png",
        json['weather'][0]['description'],
        json['dt'],
        json['name'] ?? '');
  }
}
