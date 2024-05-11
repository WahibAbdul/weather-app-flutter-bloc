import 'package:open_weather_api/src/models/feel.dart';
import 'package:test/test.dart';

void main() {
  group('Feel', () {
    test('fromJson creates correct Feel object', () {
      final json = {
        'day': 10.5,
        'night': 20.5,
        'eve': 15.5,
        'morn': 12.5,
      };

      final feel = Feel.fromJson(json);

      expect(feel.day, 10.5);
      expect(feel.night, 20.5);
      expect(feel.eve, 15.5);
      expect(feel.morn, 12.5);
    });
  });
}
