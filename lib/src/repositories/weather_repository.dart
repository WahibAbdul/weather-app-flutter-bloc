import 'package:open_weather_api/open_weather_api.dart';

class WeatherRepository {
  WeatherRepository(this._api);

  final OpenWeatherApiClient _api;

  Future<LocationWeather> fetchWeather(
    double lat,
    double lng, {
    WeatherUnit unit = WeatherUnit.metric,
  }) async {
    final response = await _api.getWeather(lat, lng, unit: unit);
    return response;
  }
}
