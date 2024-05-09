import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'current_forecast.g.dart';

@JsonSerializable()
class CurrentForecast extends Forecast {
  @JsonKey(name: 'temp')
  double temperature;
  @JsonKey(name: 'feels_like')
  double feelsLike;

  CurrentForecast({
    required this.temperature,
    required this.feelsLike,
    required super.dateTime,
    required super.pressure,
    required super.humidity,
    required super.dewPoint,
    required super.windSpeed,
    required super.windDeg,
    required super.weather,
    required super.clouds,
    required super.uvi,
  });

  factory CurrentForecast.fromJson(Map<String, dynamic> json) => _$CurrentForecastFromJson(json);
}
