import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final int id;
  final String main;
  final String description;
  final String _icon;

  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required String icon,
  }) : _icon = icon;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  String get iconUrl => 'https://openweathermap.org/img/wn/$_icon@2x.png';
}
