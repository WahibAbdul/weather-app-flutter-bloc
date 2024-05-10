part of 'location_weather_bloc.dart';

enum LocationWeatherStateStatus { initial, loading, loaded, error }

@immutable
class LocationWeatherState extends Equatable {
  final LocationWeatherStateStatus status;
  final WeatherForecast? forecast;
  final Location location;
  final Unit unit;
  final String? error;

  const LocationWeatherState({
    this.status = LocationWeatherStateStatus.initial,
    this.forecast,
    this.location = const Location(lat: 52.520008, lng: 13.404954, name: 'Berlin'),
    this.unit = Unit.metric,
    this.error,
  });

  LocationWeatherState copyWith({
    LocationWeatherStateStatus? status,
    WeatherForecast? forecast,
    Location? location,
    String? error,
    Unit? unit,
  }) =>
      LocationWeatherState(
        status: status ?? this.status,
        forecast: forecast ?? this.forecast,
        error: error ?? this.error,
        location: location ?? this.location,
        unit: unit ?? this.unit,
      );

  @override
  List<Object?> get props => [
        status,
        forecast,
        error,
        location,
        unit,
      ];
}
