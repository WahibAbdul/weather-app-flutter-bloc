import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:flutter/material.dart';

import 'atmospheric_data_tile.dart';

class WeatherAtmosphericGrid extends StatelessWidget {
  const WeatherAtmosphericGrid({
    super.key,
    required this.weather,
    this.canScroll = true,
    this.unit = Unit.metric,
  });
  final bool canScroll;
  final Weather weather;
  final Unit unit;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: canScroll ? null : const NeverScrollableScrollPhysics(),
      crossAxisSpacing: Dimens.margin,
      mainAxisSpacing: Dimens.margin,
      childAspectRatio: 3 / 2.5,
      children: [
        AtmosphericDataTile(title: 'Humidity', value: '${weather.humidity}%'),
        AtmosphericDataTile(title: 'Pressure', value: weather.airPressure.toString(), description: 'hPa'),
        AtmosphericDataTile(
          title: 'Wind',
          value: '${weather.getWindSpeed(unit)} ${unit.windSpeedUnit}',
        ),
        AtmosphericDataTile(title: 'UV Index', value: weather.uvi.toStringAsFixed(1)),
      ],
    );
  }
}
