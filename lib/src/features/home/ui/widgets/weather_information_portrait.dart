import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/common/constants/spacing.dart';
import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/upcoming_forecast_view.dart';
import 'package:flutter/material.dart';

import 'weather_atmospheric_grid.dart';
import 'weather_info_header.dart';

class WeatherInformationPortrait extends StatelessWidget {
  const WeatherInformationPortrait({
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Spacing.vertical,
          if (selectedWeather != null) WeatherInfoHeader(weather: selectedWeather!, unit: unit),
          Spacing.vertical,
          Padding(
            padding: const EdgeInsets.all(Dimens.margin),
            child: UpcomingForecastView(
              daily: weeklyForecast,
              unit: unit,
              onSelected: onWeatherSelected,
            ),
          ),
          if (selectedWeather != null)
            Padding(
              padding: const EdgeInsets.all(Dimens.margin),
              child: WeatherAtmosphericGrid(
                weather: selectedWeather!,
                canScroll: false,
                unit: unit,
              ),
            ),
        ],
      ),
    );
  }
}
