import 'package:open_weather_api/open_weather_api.dart';
import 'package:test/test.dart';

void main() {
  group('Weather', () {
    test('fromJson creates correct Weather object', () {
      final json = {
        'id': 800,
        'main': 'Clear',
        'description': 'clear sky',
        'icon': '01d',
      };

      final weather = Weather.fromJson(json);

      expect(weather.id, 800);
      expect(weather.main, 'Clear');
      expect(weather.description, 'clear sky');
      expect(weather.iconUrl, 'https://openweathermap.org/img/wn/01d@2x.png');
    });
  });
}
