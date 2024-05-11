import 'package:open_weather_api/open_weather_api.dart';
import 'package:open_weather_api/src/models/current_forecast.dart';
import 'package:open_weather_api/src/models/daily_forecast.dart';
import 'package:test/test.dart';

void main() {
  group('LocationWeather', () {
    test('fromJson creates correct LocationWeather object', () {
      final json = {
        'lat': 52.5200,
        'lon': 13.4050,
        'timezone': 'Europe/Berlin',
        'timezone_offset': 7200,
        'current': {
          'temp': 20.5,
          'feels_like': 18.5,
          'dt': 1633027200,
          'pressure': 1013,
          'humidity': 72,
          'dew_point': 15.34,
          'wind_speed': 3.09,
          'wind_deg': 320,
          'weather': [
            {'id': 800, 'main': 'Clear', 'description': 'clear sky', 'icon': '01d'}
          ],
          'clouds': 0,
          'uvi': 0.34,
        },
        'daily': [
          {
            'temp': {'day': 20.5, 'min': 15.5, 'max': 25.5, 'night': 18.5, 'eve': 22.5, 'morn': 16.5},
            'feels_like': {'day': 20.5, 'night': 18.5, 'eve': 22.5, 'morn': 16.5},
            'wind_gust': 10.0,
            'pop': 20,
            'dt': 1633027200,
            'pressure': 1013,
            'humidity': 72,
            'dew_point': 15.34,
            'wind_speed': 3.09,
            'wind_deg': 320,
            'weather': [
              {'id': 800, 'main': 'Clear', 'description': 'clear sky', 'icon': '01d'}
            ],
            'clouds': 0,
            'uvi': 0.34,
            'sunrise': 1633005600,
            'sunset': 1633049200,
            'moonrise': 1633047600,
            'moonset': 1633090800,
            'moon_phase': 0.5,
            'summary': 'Clear sky',
          }
        ],
      };

      final locationWeather = LocationWeather.fromJson(json);

      expect(locationWeather.lat, 52.5200);
      expect(locationWeather.lon, 13.4050);
      expect(locationWeather.timezone, 'Europe/Berlin');
      expect(locationWeather.timezoneOffset, 7200);
      expect(locationWeather.current, isA<CurrentForecast>());
      expect(locationWeather.daily, isA<List<DailyForecast>>());
    });
  });
}
