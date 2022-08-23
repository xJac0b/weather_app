import 'dart:convert';

class Forecast {
  List<Weather> forecast;
  Forecast(this.forecast);
  factory Forecast.fromJson(json){
    
    
    
    return Forecast()
  }
}

class Weather {
  int temp;
  String name, icon, desc;
  Weather(this.temp, this.name, this.icon, this.desc);
  factory Weather.fromJson(json) {
    json = jsonDecode(json);
    //print(json['weather']['icon']);
    //String ico = json['weather'][0]['icon'];
    return Weather(
        (json['main']['temp']).round(),
        json['name'],
        // ignore: prefer_interpolation_to_compose_strings
        "https://openweathermap.org/img/wn/" +
            json['weather'][0]['icon'] +
            "@2x.png",
        json['weather'][0]['description']);
  }
}
