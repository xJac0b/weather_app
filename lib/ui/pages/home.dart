import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/logic/blocs/weather/weather_bloc.dart';
import 'package:weather_app/ui/widgets/app_bar.dart';
import 'package:weather_app/ui/widgets/city_weather.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: BlocProvider(
          create: (context) => WeatherBloc(),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case WeatherInitial:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: cityController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a city name',
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<WeatherBloc>()
                                .add(GetWeather(cityController.text));
                          },
                          child: const Text("Check weather")),
                      Text(state.error ?? '')
                    ],
                  );
                case WeatherLoading:
                  return const CircularProgressIndicator();
                case WeatherLoaded:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        CityWeather(weather: state.weather),
                        const SizedBox(height: 8.0),
                        TextField(
                          controller: cityController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a city name',
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<WeatherBloc>()
                                  .add(GetWeather(cityController.text));
                            },
                            child: const Text("Check weather")),
                      ],
                    ),
                  );
                default:
                  return const Text('default');
              }
            },
          ),
        ),
      ),
    );
  }
}
