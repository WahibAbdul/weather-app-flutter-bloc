import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/common/constants/spacing.dart';
import 'package:falconi_weather/src/features/home/bloc/location_weather_bloc.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/upcoming_forecast_view.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_atmospheric_grid.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_forecast_error_view.dart';
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
              return context.read<LocationWeatherBloc>().add(
                    LocationWeatherRefreshedEvent(),
                  );
            },
            child: switch (state.status) {
              LocationWeatherStateStatus.loading => const Center(
                    child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )),
              LocationWeatherStateStatus.initial => const SizedBox(),
              LocationWeatherStateStatus.error => const Padding(
                  padding: EdgeInsets.all(Dimens.margin),
                  child: Center(child: WeatherForecastErrorView()),
                ),
              LocationWeatherStateStatus.loaded => SingleChildScrollView(
                  child: Column(
                    children: [
                      Spacing.vertical,
                      if (state.selectedWeather != null) ...[
                        WeatherInfoHeader(
                          weather: state.selectedWeather!,
                          unit: state.unit,
                        ),
                        Spacing.vertical,
                        Padding(
                          padding: const EdgeInsets.all(Dimens.margin),
                          child: UpcomingForecastView(
                            daily: state.forecast!.daily,
                            unit: state.unit,
                            onSelected: (index, weather) =>
                                context.read<LocationWeatherBloc>().add(LocationWeatherSelectedEvent(index, weather)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Dimens.margin),
                          child: WeatherAtmosphericGrid(
                            weather: state.selectedWeather!,
                            canScroll: false,
                            unit: state.unit,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
            });
      },
    );
  }
}
