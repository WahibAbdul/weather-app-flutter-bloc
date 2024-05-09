part of 'location_weather_bloc.dart';

@immutable
sealed class LocationWeatherEvent {}

class LocationWeatherRefreshedEvent extends LocationWeatherEvent {}

class LocationWeatherFetchedEvent extends LocationWeatherEvent {
  final String location;

  LocationWeatherFetchedEvent(this.location);
}
