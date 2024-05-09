import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

/// A class that represents a temperature in Celsius
@JsonSerializable()
class Temperature {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  const Temperature({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) => _$TemperatureFromJson(json);
}
