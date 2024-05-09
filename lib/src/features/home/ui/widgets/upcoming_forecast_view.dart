import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/common/constants/spacing.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_day_info.dart';
import 'package:flutter/material.dart';

class UpcomingForecastView extends StatelessWidget {
  const UpcomingForecastView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimens.margin),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
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
          SizedBox(
            height: 100,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.margin),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => Spacing.horizontal,
                itemBuilder: (context, index) {
                  return const SizedBox.square(
                    dimension: 100,
                    child: WeatherDayInfo(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
