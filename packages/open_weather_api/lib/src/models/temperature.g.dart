// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Temperature',
      json,
      ($checkedConvert) {
        final val = Temperature(
          day: $checkedConvert('day', (v) => (v as num).toDouble()),
          min: $checkedConvert('min', (v) => (v as num).toDouble()),
          max: $checkedConvert('max', (v) => (v as num).toDouble()),
          night: $checkedConvert('night', (v) => (v as num).toDouble()),
          eve: $checkedConvert('eve', (v) => (v as num).toDouble()),
          morn: $checkedConvert('morn', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );
