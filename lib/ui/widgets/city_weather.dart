import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CityWeather extends StatelessWidget {
  final String name;
  final int temp;

  const CityWeather({Key? key, required this.name, required this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        width: double.infinity,
        child: Center(
            child: Text('$name: $temp°C',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30))));
  }
}
