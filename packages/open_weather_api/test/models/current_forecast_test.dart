import 'package:open_weather_api/open_weather_api.dart';
import 'package:open_weather_api/src/models/current_forecast.dart';
import 'package:test/test.dart';

void main() {
  group('CurrentForecast', () {
    test('fromJson creates correct CurrentForecast object', () {
      final json = {
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
      };

      final currentForecast = CurrentForecast.fromJson(json);

      expect(currentForecast.temperature, 20.5);
      expect(currentForecast.feelsLike, 18.5);
      expect(currentForecast.dateTime, 1633027200);
      expect(currentForecast.pressure, 1013);
      expect(currentForecast.humidity, 72);
      expect(currentForecast.dewPoint, 15.34);
      expect(currentForecast.windSpeed, 3.09);
      expect(currentForecast.windDeg, 320);
      expect(currentForecast.weather, isA<List<Weather>>());
      expect(currentForecast.clouds, 0);
      expect(currentForecast.uvi, 0.34);
    });
  });
}
