buildOpenWeatherException(int code, String message) {
  return switch (code) {
    400 => OpenWeatherBadRequest(),
    401 => OpenWeatherUnauthorized(),
    404 => OpenWeatherNotFound(),
    429 => OpenWeatherTooManyRequests(),
    500 => OpenWeatherServerError(),
    _ => OpenWeatherException(code, message: message)
  };
}

class OpenWeatherException implements Exception {
  final int code;
  final String message;

  OpenWeatherException(this.code, {required this.message});

  @override
  String toString() {
    return 'OpenWeatherException: Code: $code | Message: $message';
  }
}

class OpenWeatherBadRequest extends OpenWeatherException {
  OpenWeatherBadRequest()
      : super(400,
            message:
                'Bad Request. Some mandatory parameters in the request are missing or some of request parameters have incorrect format or values out of allowed range.');
}

class OpenWeatherUnauthorized extends OpenWeatherException {
  OpenWeatherUnauthorized()
      : super(401,
            message:
                'Unauthorized. API token did not providen in the request or in case API token provided in the request does not grant access to this API. ');
}

class OpenWeatherNotFound extends OpenWeatherException {
  OpenWeatherNotFound()
      : super(404,
            message:
                'Not Found. Data with requested parameters (lat, lon, date etc) does not exist in service database.');
}

class OpenWeatherTooManyRequests extends OpenWeatherException {
  OpenWeatherTooManyRequests()
      : super(429, message: 'Too Many Requests. Key quota of requests for provided API to this API was exceeded.');
}

class OpenWeatherServerError extends OpenWeatherException {
  OpenWeatherServerError() : super(500, message: 'Unknown server error');
}
