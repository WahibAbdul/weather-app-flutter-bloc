import 'package:json_annotation/json_annotation.dart';

part 'feel.g.dart';

@JsonSerializable()
class Feel {
  final double day;
  final double night;
  final double eve;
  final double morn;

  Feel({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Feel.fromJson(Map<String, dynamic> json) => _$FeelFromJson(json);
}
