enum Unit {
  metric,
  imperial;

  String get windSpeedUnit => this == Unit.metric ? 'mph' : 'km/h';

  Unit toggle() => this == Unit.metric ? Unit.imperial : Unit.metric;
}
