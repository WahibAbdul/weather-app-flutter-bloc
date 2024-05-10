import 'package:falconi_weather/src/features/home/bloc/location_weather_bloc.dart';
import 'package:falconi_weather/src/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_api/open_weather_api.dart';

void bootstrap(Widget app) {
  // We can perform all the necessary setup here like Firebase, Error Logging, toggle dev & production env etc.
  runApp(
    // Intializing Provider for AbsenceRepository because AbsenceBloc is dependent on AbsenceRepository
    RepositoryProvider(
      create: (context) {
        return WeatherRepository(OpenWeatherApiClient(apiKey: 'ebba3bd6e8a2fffee13fce84b1dcbec6'));
      },
      // Intializing Provider for LocationWeatherBloc because it is shared across the app
      child: BlocProvider(
        create: (context) => LocationWeatherBloc(context.read<WeatherRepository>()),
        child: app,
      ),
    ),
  );
}
