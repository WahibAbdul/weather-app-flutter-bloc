import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:open_weather_api/src/models/feel.dart';

part 'daily_forecast.g.dart';

@JsonSerializable()
class DailyForecast extends Forecast {
  @JsonKey(name: 'temp')
  Temperature temperature;
  @JsonKey(name: 'feels_like')
  Feel feelsLike;
  @JsonKey(name: 'wind_gust', defaultValue: 0)
  final double windGust;
  @JsonKey(defaultValue: 0)
  final int pop;
  @JsonKey(defaultValue: 0)
  final int sunrise;
  @JsonKey(defaultValue: 0)
  final int sunset;
  @JsonKey(defaultValue: 0)
  final int moonrise;
  @JsonKey(defaultValue: 0)
  final int moonset;
  @JsonKey(name: 'moon_phase', defaultValue: 0)
  final double moonPhase;
  @JsonKey(defaultValue: '')
  final String summary;

  DailyForecast({
    required this.temperature,
    required this.feelsLike,
    required this.windGust,
    required this.pop,
    required super.dateTime,
    required super.pressure,
    required super.humidity,
    required super.dewPoint,
    required super.windSpeed,
    required super.windDeg,
    required super.weather,
    required super.clouds,
    required super.uvi,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.summary,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) => _$DailyForecastFromJson(json);
}
