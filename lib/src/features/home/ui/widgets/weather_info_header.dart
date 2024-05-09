import 'package:falconi_weather/src/common/constants/spacing.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/degree_text.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/temperate_range_text.dart';
import 'package:flutter/material.dart';

class WeatherInfoHeader extends StatelessWidget {
  const WeatherInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        // LOCATION NAME
        Text('Berlin'.toUpperCase(),
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            )),

        // TEMPERATURE
        DegreeText(
            temperate: '18',
            style: theme.textTheme.displayLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
            )),
        Spacing.vMedium,
        // WEATHER DESCRIPTION
        Text('Sunny',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            )),
        TemperatureRangeText(
          minTemperature: '7',
          maxTemperature: '22',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
