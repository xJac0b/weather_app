import 'dart:convert';

class Forecast {
  List<Weather> forecast;
  Forecast(this.forecast);
  factory Forecast.fromJson(json) {
    json = jsonDecode(json);
    List lista = json['list'];
    List<Weather> forecastTemp = [];
    lista.forEach((e) => forecastTemp.add(Weather.fromJson(jsonEncode(e))));
    return Forecast(forecastTemp);
  }
}

class Weather {
  int temp, dt;
  String name, icon, desc;
  Weather(this.temp, this.icon, this.desc, this.dt, this.name);

  factory Weather.fromJson(json) {
    json = jsonDecode(json);
    //print(json['weather']['icon']);
    //String ico = json['weather'][0]['icon'];
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
