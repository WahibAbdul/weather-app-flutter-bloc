import 'package:falconi_weather/src/common/constants/spacing.dart';
import 'package:falconi_weather/src/features/home/bloc/location_weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherForecastErrorView extends StatelessWidget {
  const WeatherForecastErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.cloud_off,
          size: 100,
        ),
        Spacing.vExtra,
        Text(
          'Sorry, We are unable to fetch the weather forecast.',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacing.vExtra,
        TextButton.icon(
          onPressed: () => context.read<LocationWeatherBloc>().add(LocationWeatherRefreshedEvent()),
          icon: const Icon(
            Icons.refresh,
            size: 24,
          ),
          style: TextButton.styleFrom(
            backgroundColor: theme.colorScheme.onPrimary.withAlpha(50),
            foregroundColor: theme.colorScheme.onPrimary,
          ),
          label: Text(
            'Retry',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
