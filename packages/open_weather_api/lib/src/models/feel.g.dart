// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'feel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feel _$FeelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Feel',
      json,
      ($checkedConvert) {
        final val = Feel(
          day: $checkedConvert('day', (v) => (v as num).toDouble()),
          night: $checkedConvert('night', (v) => (v as num).toDouble()),
          eve: $checkedConvert('eve', (v) => (v as num).toDouble()),
          morn: $checkedConvert('morn', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );
