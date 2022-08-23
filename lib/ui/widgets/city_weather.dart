import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/ui/constants/colors.dart';

class CityWeather extends StatelessWidget {
  final Weather? weather;

  const CityWeather({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        color: Theme.of(context).brightness == Brightness.light
            ? Color.fromARGB(11, 0, 0, 0)
            : Colors.transparent,
        width: double.infinity,
        child: Center(
            child: Column(
          children: [
            Text('${weather?.name} ${weather?.temp}°C\n${weather?.desc}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30)),
            Image.network(weather!.icon)
          ],
        )));
  }
}

class Forecast5Days extends StatelessWidget {
  final Forecast? forecast;
  const Forecast5Days({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: false,
        ),
        items: _generateWeatherCards(forecast!.forecast));
  }

  List<Widget> _generateWeatherCards(List<Weather> list) {
    List<ClipRRect> widgets = [];
    for (Weather weather in list) {
      widgets.add(ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(fit: StackFit.expand, children: [
            Container(
                width: 500,
                height: 350,
                color: Color.fromARGB(61, 0, 0, 0),
                child: Text('${weather.temp}'))
          ])));
    }
    return widgets;
  }
}
