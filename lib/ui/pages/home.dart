import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubits/weather/weather_cubit.dart';
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
      body: BlocProvider(
        create: (context) => WeatherCubit(),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
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
                                .read<WeatherCubit>()
                                .getWeather(cityController.text.trim());
                          },
                          child: const Text("Check weather")),
                      Text(state.error ?? '')
                    ],
                  ),
                ),
              );
            }
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      CityWeather(weather: state.weather),
                      const SizedBox(height: 12.0),
                      TextField(
                        controller: cityController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a city name',
                        ),
                      ),
                      const SizedBox(height: 22.0),
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<WeatherCubit>()
                                .getWeather(cityController.text.trim());
                          },
                          child: const Text("Check weather")),
                      const SizedBox(height: 40),
                      Forecast5Days(forecast: state.forecast)
                    ],
                  ),
                ),
              );
            }
            return const Text("error");
          },
        ),
      ),
    );
  }
}
