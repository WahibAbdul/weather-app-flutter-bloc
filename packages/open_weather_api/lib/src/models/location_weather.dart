import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather_api/src/models/current_forecast.dart';
import 'package:open_weather_api/src/models/daily_forecast.dart';

part 'location_weather.g.dart';

@JsonSerializable()
class LocationWeather {
  final double lat;
  final double lon;
  final String timezone;
  @JsonKey(name: 'timezone_offset')
  final int timezoneOffset;
  final CurrentForecast current;
  @JsonKey(defaultValue: [])
  final List<DailyForecast> daily;

  const LocationWeather({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
  });

  factory LocationWeather.fromJson(Map<String, dynamic> json) => _$LocationWeatherFromJson(json);
}
