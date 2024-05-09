part of 'location_weather_bloc.dart';

enum LocationWeatherStateStatus { initial, loading, loaded, error }

@immutable
class LocationWeatherState extends Equatable {
  final LocationWeatherStateStatus status;
  final LocationWeather? weather;
  final Location location;
  final WeatherUnit unit;
  final String? error;

  const LocationWeatherState({
    this.status = LocationWeatherStateStatus.initial,
    this.weather,
    this.location = const Location(lat: 52.520008, lng: 13.404954, name: 'Berlin'),
    this.unit = WeatherUnit.metric,
    this.error,
  });

  LocationWeatherState copyWith({
    LocationWeatherStateStatus? status,
    LocationWeather? weather,
    Location? location,
    String? error,
    WeatherUnit? unit,
  }) =>
      LocationWeatherState(
        status: status ?? this.status,
        weather: weather ?? this.weather,
        error: error ?? this.error,
        location: location ?? this.location,
        unit: unit ?? this.unit,
      );

  @override
  List<Object?> get props => [
        status,
        weather,
        error,
        location,
        unit,
      ];
}
