import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:flutter/material.dart';

import 'weather_information_landscape.dart';
import 'weather_information_portrait.dart';

class WeatherInformationAdaptive extends StatelessWidget {
  const WeatherInformationAdaptive({
    super.key,
    this.selectedWeather,
    required this.weeklyForecast,
    this.unit = Unit.metric,
    this.onWeatherSelected,
  });
  final Weather? selectedWeather;
  final List<Weather> weeklyForecast;
  final Unit unit;
  final Function(int, Weather)? onWeatherSelected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    bool hasMoreWidth = size.width > size.height;
    return hasMoreWidth
        ? WeatherInformationLandscape(
            selectedWeather: selectedWeather,
            weeklyForecast: weeklyForecast,
            unit: unit,
            onWeatherSelected: (index, weather) => onWeatherSelected,
          )
        : WeatherInformationPortrait(
            selectedWeather: selectedWeather,
            weeklyForecast: weeklyForecast,
            unit: unit,
            onWeatherSelected: (index, weather) => onWeatherSelected,
          );
  }
}
