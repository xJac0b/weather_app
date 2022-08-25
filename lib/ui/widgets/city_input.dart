import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubits/city/city_cubit.dart';
import 'package:weather_app/logic/cubits/weather/weather_cubit.dart';

class CityInput extends StatelessWidget {
  const CityInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(
        builder: (context, state) => Column(
              children: [
                TextField(
                  onChanged: (input) =>
                      context.read<CityCubit>().inputChanged(input),
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
                          .getWeather(state.value.trim());
                    },
                    child: const Text("Check weather"))
              ],
            ));
  }
}
