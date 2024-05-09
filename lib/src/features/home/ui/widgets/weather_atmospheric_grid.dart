import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:flutter/material.dart';

import 'atmospheric_data_tile.dart';

class WeatherAtmosphericGrid extends StatelessWidget {
  const WeatherAtmosphericGrid({super.key, this.canScroll = true});
  final bool canScroll;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: Dimens.margin,
      mainAxisSpacing: Dimens.margin,
      childAspectRatio: 3 / 2.5,
      children: const [
        AtmosphericDataTile(title: 'Humidity', value: '67%'),
        AtmosphericDataTile(title: 'Pressure', value: '1013', description: 'hPa'),
        AtmosphericDataTile(
          title: 'Wind',
          value: '5 km/h',
        ),
        AtmosphericDataTile(title: 'UV Index', value: '0.6'),
      ],
    );
  }
}
