import 'package:cached_network_image/cached_network_image.dart';
import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/extensions/string_extension.dart';
import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:falconi_weather/src/features/home/bloc/location_weather_bloc.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/degree_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum WeatherInfoHeaderMenu { changeUnit }

class WeatherInfoHeader extends StatelessWidget {
  const WeatherInfoHeader({
    super.key,
    required this.location,
    required this.weather,
    required this.unit,
  });
  final String location;
  final Weather weather;
  final Unit unit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.margin),
              onPressed: () => _onSearchAction(context),
              icon: const Icon(Icons.search),
            ),
            // LOCATION NAME
            Text(location.toUpperCase(),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                )),
            PopupMenuButton(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.margin),
                icon: const Icon(Icons.more_vert),
                onSelected: (value) {
                  context.read<LocationWeatherBloc>().add(LocationWeatherUnitChangedEvent(unit.toggle()));
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: WeatherInfoHeaderMenu.changeUnit,
                      child: Text(
                        unit == Unit.metric ? 'Change to Imperial' : 'Change to Metric',
                      ),
                    ),
                  ];
                }),
          ],
        ),
        if (weather.imageUrl != null)
          CachedNetworkImage(
            imageUrl: weather.imageUrl!,
            width: 100,
            height: 100,
          ),
        // TEMPERATURE
        DegreeText(
            temperate: weather.getTemperature(unit)?.toString() ?? '-',
            isCelsius: unit == Unit.metric,
            style: theme.textTheme.displayLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
            )),
        // WEATHER IMAGE

        // WEATHER DESCRIPTION
        Text(weather.description.capitalized(),
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }

  void _onMenuPressed() {}

  void _onSearchAction(BuildContext context) {}
}
