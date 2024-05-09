import 'package:falconi_weather/src/common/constants/dimens.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/upcoming_forecast_view.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_atmospheric_grid.dart';
import 'package:falconi_weather/src/features/home/ui/widgets/weather_info_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          WeatherInfoHeader(),
          Padding(
            padding: EdgeInsets.all(Dimens.margin),
            child: UpcomingForecastView(),
          ),
          Padding(
            padding: EdgeInsets.all(Dimens.margin),
            child: WeatherAtmosphericGrid(canScroll: false),
          ),
        ],
      ),
    );
  }
}
