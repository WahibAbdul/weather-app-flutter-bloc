import 'package:open_weather_api/open_weather_api.dart';
import 'package:test/test.dart';

void main() {
  group('Forecast', () {
    test('fromJson creates correct Forecast object', () {
      final json = {
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

      final forecast = Forecast.fromJson(json);

      expect(forecast.dateTime, 1633027200);
      expect(forecast.pressure, 1013);
      expect(forecast.humidity, 72);
      expect(forecast.dewPoint, 15.34);
      expect(forecast.windSpeed, 3.09);
      expect(forecast.windDeg, 320);
      expect(forecast.weather, isA<List<Weather>>());
      expect(forecast.clouds, 0);
      expect(forecast.uvi, 0.34);
    });
  });
}
