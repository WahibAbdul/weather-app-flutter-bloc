import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/common/constants/spacing.dart';
import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_day_info.dart';
import 'package:flutter/material.dart';

class UpcomingForecastView extends StatelessWidget {
  const UpcomingForecastView({
    super.key,
    required this.daily,
    this.unit = Unit.metric,
  });
  final List<Weather> daily;
  final Unit unit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimens.margin),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.margin),
            child: Text('Upcoming Forecast',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onPrimary.withAlpha(180),
                  fontWeight: FontWeight.w600,
                )),
          ),
          Spacing.vExtra,
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 150,
            ),
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.margin),
                itemCount: daily.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => Spacing.horizontal,
                itemBuilder: (context, index) => ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 110,
                      ),
                      child: WeatherDayInfo(weather: daily[index], unit: unit),
                    )),
          ),
        ],
      ),
    );
  }
}
