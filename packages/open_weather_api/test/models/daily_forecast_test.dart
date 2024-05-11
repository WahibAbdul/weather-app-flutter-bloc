import 'package:open_weather_api/src/models/feel.dart';
import 'package:open_weather_api/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('DailyForecast', () {
    test('fromJson creates correct DailyForecast object', () {
      final json = {
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
      };

      final dailyForecast = DailyForecast.fromJson(json);

      expect(dailyForecast.temperature, isA<Temperature>());
      expect(dailyForecast.feelsLike, isA<Feel>());
      expect(dailyForecast.windGust, 10.0);
      expect(dailyForecast.pop, 20);
      expect(dailyForecast.dateTime, 1633027200);
      expect(dailyForecast.pressure, 1013);
      expect(dailyForecast.humidity, 72);
      expect(dailyForecast.dewPoint, 15.34);
      expect(dailyForecast.windSpeed, 3.09);
      expect(dailyForecast.windDeg, 320);
      expect(dailyForecast.weather, isA<List<Weather>>());
      expect(dailyForecast.clouds, 0);
      expect(dailyForecast.uvi, 0.34);
      expect(dailyForecast.sunrise, 1633005600);
      expect(dailyForecast.sunset, 1633049200);
      expect(dailyForecast.moonrise, 1633047600);
      expect(dailyForecast.moonset, 1633090800);
      expect(dailyForecast.moonPhase, 0.5);
      expect(dailyForecast.summary, 'Clear sky');
    });
  });
}
