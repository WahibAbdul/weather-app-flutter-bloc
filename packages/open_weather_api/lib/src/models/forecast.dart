import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'forecast.g.dart';

/// A class that represents a forecast. Temperature is a generic type either String or Temperature.
@JsonSerializable()
class Forecast {
  @JsonKey(name: 'dt')
  final int dateTime;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'dew_point')
  final double dewPoint;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_deg')
  final int windDeg;
  final List<Weather> weather;
  @JsonKey(defaultValue: 0)
  final int clouds;
  @JsonKey(defaultValue: 0)
  final double uvi;

  const Forecast({
    required this.dateTime,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.pressure,
    required this.windDeg,
    required this.weather,
    required this.clouds,
    required this.uvi,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
}
