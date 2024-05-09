// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'location_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationWeather _$LocationWeatherFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LocationWeather',
      json,
      ($checkedConvert) {
        final val = LocationWeather(
          lat: $checkedConvert('lat', (v) => (v as num).toDouble()),
          lon: $checkedConvert('lon', (v) => (v as num).toDouble()),
          timezone: $checkedConvert('timezone', (v) => v as String),
          timezoneOffset:
              $checkedConvert('timezone_offset', (v) => (v as num).toInt()),
          current: $checkedConvert('current',
              (v) => CurrentForecast.fromJson(v as Map<String, dynamic>)),
          daily: $checkedConvert(
              'daily',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          DailyForecast.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  []),
        );
        return val;
      },
      fieldKeyMap: const {'timezoneOffset': 'timezone_offset'},
    );
