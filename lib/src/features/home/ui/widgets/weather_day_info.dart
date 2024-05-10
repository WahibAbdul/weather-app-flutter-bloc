import 'package:cached_network_image/cached_network_image.dart';
import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/extensions/date_extension.dart';
import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:flutter/material.dart';

class WeatherDayInfo extends StatelessWidget {
  const WeatherDayInfo({
    super.key,
    required this.weather,
    this.unit = Unit.metric,
  });
  final Weather weather;
  final Unit unit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.marginMedium,
        vertical: Dimens.marginSmall,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(50),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.date.isToday ? 'Today' : weather.date.formattedDate('EEE'),
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (weather.imageUrl != null)
            CachedNetworkImage(
              imageUrl: weather.imageUrl!,
              width: 50,
              height: 50,
            ),
          Text(
            '${weather.getMinTemperature(unit)}°/${weather.getMaxTemperature(unit)}°',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
