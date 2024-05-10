import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:falconi_weather/src/features/home/bloc/location_weather_bloc.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_forecast_error_view.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_information_landscape.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_information_portrait.dart';
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
              LocationWeatherStateStatus.loaded => OrientationBuilder(
                  builder: (context, orientation) => orientation == Orientation.portrait
                      ? WeatherInformationPortrait(
                          selectedWeather: state.selectedWeather,
                          weeklyForecast: state.forecast?.daily ?? [],
                          unit: state.unit,
                          onWeatherSelected: (index, weather) => _onWeatherSelected(context, index, weather),
                        )
                      : WeatherInformationLandscape(
                          selectedWeather: state.selectedWeather,
                          weeklyForecast: state.forecast?.daily ?? [],
                          unit: state.unit,
                          onWeatherSelected: (index, weather) => _onWeatherSelected(context, index, weather),
                        ),
                ),
            });
      },
    );
  }

  void _onWeatherSelected(BuildContext context, int index, Weather weather) {
    context.read<LocationWeatherBloc>().add(
          LocationWeatherSelectedEvent(index, weather),
        );
  }
}
