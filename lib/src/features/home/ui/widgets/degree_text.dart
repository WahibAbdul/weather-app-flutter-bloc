import 'package:flutter/material.dart';

class DegreeText extends StatelessWidget {
  const DegreeText({
    super.key,
    required this.temperate,
    this.isCelsius = true,
    this.style,
  });
  final String temperate;
  final bool isCelsius;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$temperate${isCelsius ? '℃' : '℉'}',
      style: style,
    );
  }
}
