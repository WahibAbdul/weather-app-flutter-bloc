import 'package:cached_network_image/cached_network_image.dart';
import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/extensions/date_extension.dart';
import 'package:falconi_weather/src/common/extensions/string_extension.dart';
import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/degree_text.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/temperate_range_text.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_header_menu_button.dart';
import 'package:flutter/material.dart';

class WeatherInfoHeader extends StatelessWidget {
  const WeatherInfoHeader({
    super.key,
    required this.weather,
    required this.unit,
  });

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
            // Dummy Button For Positioning
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.refresh,
                color: Colors.transparent,
              ),
            ),
            // LOCATION NAME
            Text(weather.date.isToday ? 'Current' : weather.date.formattedDate('EEEE'),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                )),
            const WeatherInfoHeaderMenuButton(),
          ],
        ),
        // WEATHER IMAGE

        if (weather.imageUrl != null)
          CachedNetworkImage(
            imageUrl: weather.imageUrl!,
            width: 100,
            height: 100,
          ),
        // TEMPERATURE
        DegreeText(
            temperate: weather.getTemperature(unit).toString(),
            isCelsius: unit == Unit.metric,
            style: theme.textTheme.displayLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
            )),
        // WEATHER DESCRIPTION
        Text(weather.description.capitalized(),
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            )),
        TemperatureRangeText(
          minTemperature: weather.getMinTemperature(unit).toString(),
          maxTemperature: weather.getMaxTemperature(unit).toString(),
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  void _onSearchAction(BuildContext context) {}
}
