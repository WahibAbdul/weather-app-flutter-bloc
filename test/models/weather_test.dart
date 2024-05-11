import 'package:falconi_weather/src/common/models/weather.dart';
import 'package:test/test.dart';
import 'package:falconi_weather/src/common/enums/units.dart';

void main() {
  group('Weather', () {
    test('temperature conversion methods work correctly', () {
      final weather = Weather(
        date: DateTime.now(),
        temperature: 20,
        description: 'Clear sky',
        humidity: 72,
        windSpeed: 10,
        uvi: 0.34,
        airPressure: 1013,
      );

      expect(weather.getTemperature(Unit.metric), 20);
      expect(weather.getTemperature(Unit.imperial), 68); // 20°C is approximately 68°F

      expect(weather.getMinTemperature(Unit.metric), null);
      expect(weather.getMinTemperature(Unit.imperial), null);

      expect(weather.getMaxTemperature(Unit.metric), null);
      expect(weather.getMaxTemperature(Unit.imperial), null);

      expect(weather.getWindSpeed(Unit.metric), 10);
      expect(weather.getWindSpeed(Unit.imperial), 16); // 10 mph is approximately 6 mph
    });
  });
}
