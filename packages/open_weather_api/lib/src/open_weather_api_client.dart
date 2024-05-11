import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_weather_api/src/exceptions.dart';
import 'package:open_weather_api/src/models/location_weather.dart';
import 'package:open_weather_api/src/models/weather_unit.dart';

class OpenWeatherApiClient {
  final String apiKey;
  final http.Client httpClient;

  OpenWeatherApiClient({
    required this.apiKey,
    http.Client? httpClient,
  }) : httpClient = httpClient ?? http.Client();

  /// Get the weather for a specific city using Latitude and Longitude
  Future<LocationWeather> getWeather(
    double lat,
    double lng, {
    WeatherUnit unit = WeatherUnit.metric,
  }) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lng&appid=$apiKey&units=${unit.name}',
    );
    final response = await httpClient.get(url).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final data = LocationWeather.fromJson(json);
      return data;
    }
    throw buildOpenWeatherException(response.statusCode, '');
  }
}
