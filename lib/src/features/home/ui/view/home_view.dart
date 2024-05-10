import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/common/constants/spacing.dart';
import 'package:falconi_weather/src/features/home/bloc/location_weather_bloc.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/upcoming_forecast_view.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_atmospheric_grid.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_info_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationWeatherBloc, LocationWeatherState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<LocationWeatherBloc>().add(
                  LocationWeatherRefreshedEvent(),
                );
          },
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              children: [
                Spacing.vertical,
                if (state.forecast != null) ...[
                  WeatherInfoHeader(
                    location: 'Berlin',
                    weather: state.forecast!.current,
                    unit: state.unit,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimens.margin),
                    child: UpcomingForecastView(
                      daily: state.forecast!.daily,
                      unit: state.unit,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimens.margin),
                    child: WeatherAtmosphericGrid(
                      weather: state.forecast!.current,
                      canScroll: false,
                      unit: state.unit,
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
