// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'daily_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DailyForecast',
      json,
      ($checkedConvert) {
        final val = DailyForecast(
          temperature: $checkedConvert(
              'temp', (v) => Temperature.fromJson(v as Map<String, dynamic>)),
          feelsLike: $checkedConvert(
              'feels_like', (v) => Feel.fromJson(v as Map<String, dynamic>)),
          windGust:
              $checkedConvert('wind_gust', (v) => (v as num?)?.toDouble() ?? 0),
          pop: $checkedConvert('pop', (v) => (v as num?)?.toInt() ?? 0),
          dateTime: $checkedConvert('dt', (v) => (v as num).toInt()),
          pressure: $checkedConvert('pressure', (v) => (v as num).toInt()),
          humidity: $checkedConvert('humidity', (v) => (v as num).toInt()),
          dewPoint: $checkedConvert('dew_point', (v) => (v as num).toDouble()),
          windSpeed:
              $checkedConvert('wind_speed', (v) => (v as num).toDouble()),
          windDeg: $checkedConvert('wind_deg', (v) => (v as num).toInt()),
          weather: $checkedConvert(
              'weather',
              (v) => (v as List<dynamic>)
                  .map((e) => Weather.fromJson(e as Map<String, dynamic>))
                  .toList()),
          clouds: $checkedConvert('clouds', (v) => (v as num?)?.toInt() ?? 0),
          uvi: $checkedConvert('uvi', (v) => (v as num?)?.toDouble() ?? 0),
          sunrise: $checkedConvert('sunrise', (v) => (v as num?)?.toInt() ?? 0),
          sunset: $checkedConvert('sunset', (v) => (v as num?)?.toInt() ?? 0),
          moonrise:
              $checkedConvert('moonrise', (v) => (v as num?)?.toInt() ?? 0),
          moonset: $checkedConvert('moonset', (v) => (v as num?)?.toInt() ?? 0),
          moonPhase: $checkedConvert(
              'moon_phase', (v) => (v as num?)?.toDouble() ?? 0),
          summary: $checkedConvert('summary', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'temperature': 'temp',
        'feelsLike': 'feels_like',
        'windGust': 'wind_gust',
        'dateTime': 'dt',
        'dewPoint': 'dew_point',
        'windSpeed': 'wind_speed',
        'windDeg': 'wind_deg',
        'moonPhase': 'moon_phase'
      },
    );
