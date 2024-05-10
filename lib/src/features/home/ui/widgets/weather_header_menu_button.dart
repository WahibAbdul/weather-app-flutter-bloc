import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/features/home/bloc/location_weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum WeatherInfoHeaderMenu { changeUnit }

class WeatherInfoHeaderMenuButton extends StatelessWidget {
  const WeatherInfoHeaderMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final unit = context.select((LocationWeatherBloc bloc) => bloc.state.unit);
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) => _onSelect(context, value, unit),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: WeatherInfoHeaderMenu.changeUnit,
            child: Text(
              unit == Unit.metric ? 'Change to Imperial' : 'Change to Metric',
            ),
          ),
        ];
      },
    );
  }

  void _onSelect(BuildContext context, WeatherInfoHeaderMenu menu, Unit unit) {
    if (menu == WeatherInfoHeaderMenu.changeUnit) {
      context.read<LocationWeatherBloc>().add(
            LocationWeatherUnitChangedEvent(unit.toggle()),
          );
    }
  }
}
