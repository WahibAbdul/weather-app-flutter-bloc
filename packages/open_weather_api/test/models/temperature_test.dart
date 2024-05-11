import 'package:open_weather_api/open_weather_api.dart';
import 'package:test/test.dart';

void main() {
  group('Temperature', () {
    test('fromJson creates correct Temperature object', () {
      final json = {
        'day': 20.5,
        'min': 15.5,
        'max': 25.5,
        'night': 18.5,
        'eve': 22.5,
        'morn': 16.5,
      };

      final temperature = Temperature.fromJson(json);

      expect(temperature.day, 20.5);
      expect(temperature.min, 15.5);
      expect(temperature.max, 25.5);
      expect(temperature.night, 18.5);
      expect(temperature.eve, 22.5);
      expect(temperature.morn, 16.5);
    });
  });
}
