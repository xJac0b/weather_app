import 'package:http/http.dart' as http;

const String apiKey = 'b7df371c9d06ab9cbc43892630a2872d';

class WeatherAPI {
  Future<String> getRawWeather(String city) async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'));
    final String rawWeather = response.body;
    return rawWeather;
  }
}
