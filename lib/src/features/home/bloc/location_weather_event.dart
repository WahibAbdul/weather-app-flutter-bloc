part of 'location_weather_bloc.dart';

@immutable
sealed class LocationWeatherEvent {}

class LocationWeatherRefreshedEvent extends LocationWeatherEvent {}

class LocationWeatherFetchedEvent extends LocationWeatherEvent {
  final String location;

  LocationWeatherFetchedEvent(this.location);
}

class LocationWeatherUnitChangedEvent extends LocationWeatherEvent {
  final Unit unit;

  LocationWeatherUnitChangedEvent(this.unit);
}

class LocationWeatherSelectedEvent extends LocationWeatherEvent {
  final int index;
  final Weather weather;

  LocationWeatherSelectedEvent(this.index, this.weather);
}
