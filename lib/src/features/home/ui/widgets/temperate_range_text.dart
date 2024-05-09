import 'package:flutter/material.dart';

class TemperatureRangeText extends StatelessWidget {
  const TemperatureRangeText({
    super.key,
    required this.minTemperature,
    required this.maxTemperature,
    this.style,
  });
  final String minTemperature;
  final String maxTemperature;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      'H:$maxTemperature°   L:$minTemperature°',
      style: style,
    );
  }
}
