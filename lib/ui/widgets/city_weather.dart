import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/ui/constants/colors.dart';

class CityWeather extends StatelessWidget {
  final Weather? weather;

  const CityWeather({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          height: 200.0,
          color: Theme.of(context).brightness == Brightness.light
              ? Color.fromARGB(105, 0, 63, 131)
              : Color.fromARGB(105, 0, 63, 131),
          width: double.infinity,
          child: Column(
            children: [
              Text('${weather!.name} ${weather!.temp}°C',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 38, fontWeight: FontWeight.bold)),
              Text('${weather!.desc}',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
              Image.network(weather!.icon),
            ],
          )),
    );
  }
}

class Forecast5Days extends StatelessWidget {
  final Forecast? forecast;
  const Forecast5Days({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 270,
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
          borderRadius: BorderRadius.circular(10),
          child: Stack(fit: StackFit.expand, children: [
            Container(
                width: 100,
                color: Color.fromARGB(105, 0, 63, 131),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${weather.temp}°C',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 38, fontWeight: FontWeight.bold)),
                    Text('${weather.desc}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22)),
                    Image.network(weather.icon),
                    Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        DateFormat('E, d MMMM\nH:mm')
                            .format(DateTime.fromMillisecondsSinceEpoch(
                                weather.dt * 1000))
                            .toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20)),
                  ],
                ))
          ])));
    }
    return widgets;
  }
}
