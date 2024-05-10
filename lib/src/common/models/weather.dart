import 'package:equatable/equatable.dart';
import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/extensions/double_extension.dart';
import 'package:flutter/foundation.dart';

@immutable
class Weather extends Equatable {
  final DateTime date;

  /// In Celsius
  final int _temperature;

  /// In Celsius
  final int? _minTemperature;

  /// In Celsius
  final int? _maxTemperature;
  final String description;
  final int humidity;

  /// In Mile per hour MPH
  final int _windSpeed;
  final double uvi;
  // In hectopascal hPa
  final int airPressure;
  final String? imageUrl;

  const Weather({
    required this.date,
    required int temperature,
    required this.description,
    int? minTemperature,
    int? maxTemperature,
    required this.humidity,
    required int windSpeed,
    required this.uvi,
    required this.airPressure,
    this.imageUrl,
  })  : _temperature = temperature,
        _minTemperature = minTemperature,
        _maxTemperature = maxTemperature,
        _windSpeed = windSpeed;

  int getTemperature(Unit unit) {
    return unit == Unit.metric ? _temperature : _temperature.toFahrenheit().toInt();
  }

  int? getMinTemperature(Unit unit) {
    return unit == Unit.metric ? _minTemperature : _minTemperature?.toFahrenheit().toInt();
  }

  int? getMaxTemperature(Unit unit) {
    return unit == Unit.metric ? _maxTemperature : _maxTemperature?.toFahrenheit().toInt();
  }

  int? getWindSpeed(Unit unit) {
    return unit == Unit.metric ? _windSpeed : _windSpeed.toKm().toInt();
  }

  @override
  List<Object?> get props => [
        date,
        _temperature,
        description,
        _minTemperature,
        _maxTemperature,
        humidity,
        _windSpeed,
        uvi,
        airPressure,
        imageUrl,
      ];
}
