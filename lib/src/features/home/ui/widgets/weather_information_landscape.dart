import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/common/constants/spacing.dart';
import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/upcoming_forecast_view.dart';
import 'package:flutter/material.dart';

import 'weather_atmospheric_grid.dart';
import 'weather_info_header.dart';

class WeatherInformationLandscape extends StatelessWidget {
  const WeatherInformationLandscape({
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
    return Row(
      children: [
        if (selectedWeather != null)
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.marginLarge),
            child: WeatherInfoHeader(weather: selectedWeather!, unit: unit),
          )),
        Spacing.hLarge,
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: Dimens.marginLarge),
            children: [
              UpcomingForecastView(
                daily: weeklyForecast,
                unit: unit,
                onSelected: onWeatherSelected,
              ),
              Spacing.vLarge,
              if (selectedWeather != null)
                WeatherAtmosphericGrid(
                  weather: selectedWeather!,
                  canScroll: false,
                  unit: unit,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
