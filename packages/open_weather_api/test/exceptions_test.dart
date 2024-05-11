import 'package:open_weather_api/src/exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('OpenWeatherException', () {
    test('returns correct exception type based on error code', () {
      expect(buildOpenWeatherException(400, 'Test message'), isA<OpenWeatherBadRequest>());
      expect(buildOpenWeatherException(401, 'Test message'), isA<OpenWeatherUnauthorized>());
      expect(buildOpenWeatherException(404, 'Test message'), isA<OpenWeatherNotFound>());
      expect(buildOpenWeatherException(429, 'Test message'), isA<OpenWeatherTooManyRequests>());
      expect(buildOpenWeatherException(500, 'Test message'), isA<OpenWeatherServerError>());
      expect(buildOpenWeatherException(999, 'Test message'), isA<OpenWeatherException>());
    });

    test('sets correct message for each exception type', () {
      expect(buildOpenWeatherException(400, 'Test message').message,
          'Bad Request. Some mandatory parameters in the request are missing or some of request parameters have incorrect format or values out of allowed range.');
      expect(buildOpenWeatherException(401, 'Test message').message,
          'Unauthorized. API token did not providen in the request or in case API token provided in the request does not grant access to this API. ');
      expect(buildOpenWeatherException(404, 'Test message').message,
          'Not Found. Data with requested parameters (lat, lon, date etc) does not exist in service database.');
      expect(buildOpenWeatherException(429, 'Test message').message,
          'Too Many Requests. Key quota of requests for provided API to this API was exceeded.');
      expect(buildOpenWeatherException(500, 'Test message').message, 'Unknown server error');
      expect(buildOpenWeatherException(999, 'Test message').message, 'Test message');
    });
  });
}
