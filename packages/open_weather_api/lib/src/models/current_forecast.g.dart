// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'current_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentForecast _$CurrentForecastFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CurrentForecast',
      json,
      ($checkedConvert) {
        final val = CurrentForecast(
          temperature: $checkedConvert('temp', (v) => (v as num).toDouble()),
          feelsLike:
              $checkedConvert('feels_like', (v) => (v as num).toDouble()),
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
        );
        return val;
      },
      fieldKeyMap: const {
        'temperature': 'temp',
        'feelsLike': 'feels_like',
        'dateTime': 'dt',
        'dewPoint': 'dew_point',
        'windSpeed': 'wind_speed',
        'windDeg': 'wind_deg'
      },
    );
