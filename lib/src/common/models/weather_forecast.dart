import 'package:equatable/equatable.dart';
import 'weather.dart';
import 'package:flutter/foundation.dart';

@immutable
class WeatherForecast extends Equatable {
  final String location;
  final Weather current;
  final List<Weather> daily;

  const WeatherForecast({
    required this.location,
    required this.current,
    required this.daily,
  });

  @override
  List<Object?> get props => [
        location,
        current,
        daily,
      ];
}
