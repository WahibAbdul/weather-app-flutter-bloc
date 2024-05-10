import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:falconi_weather/src/common/models/weather_forecast.dart';
import 'package:open_weather_api/open_weather_api.dart' as api;

class WeatherRepository {
  WeatherRepository(this._api);

  final api.OpenWeatherApiClient _api;

  Future<WeatherForecast> fetchWeather(double lat, double lng) async {
    final response = await _api.getWeather(lat, lng);
    // Map API response to our model
    final forecast = WeatherForecast(
      location: '',
      current: Weather(
        date: DateTime.fromMillisecondsSinceEpoch(response.current.dateTime * 1000),
        temperature: response.current.temperature.toInt(),
        description: response.current.weather.firstOrNull?.description ?? '',
        imageUrl: response.current.weather.firstOrNull?.iconUrl,
        humidity: response.current.humidity,
        windSpeed: response.current.windSpeed.toInt(),
        uvi: response.current.uvi,
        airPressure: response.current.pressure,
      ),
      daily: response.daily
          .map((e) => Weather(
                date: DateTime.fromMillisecondsSinceEpoch(e.dateTime * 1000),
                minTemperature: e.temperature.min.toInt(),
                maxTemperature: e.temperature.max.toInt(),
                description: e.weather.firstOrNull?.description ?? '',
                imageUrl: e.weather.firstOrNull?.iconUrl,
                humidity: e.humidity,
                windSpeed: e.windSpeed.toInt(),
                uvi: e.uvi,
                airPressure: e.pressure,
              ))
          .toList(),
    );

    return forecast;
  }
}
