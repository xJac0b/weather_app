import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/ui/constants/colors.dart';

class CityWeather extends StatelessWidget {
  final Forecast? weather;

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

class CityWeather5Days extends StatelessWidget {
  final List forecastList;
  const CityWeather5Days({Key? key, required this.forecastList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: false,
        ),
        items: forecastList.map());
  }
}
