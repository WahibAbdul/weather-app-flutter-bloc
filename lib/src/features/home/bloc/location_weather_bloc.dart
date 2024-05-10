import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:falconi_weather/src/common/enums/units.dart';
import 'package:falconi_weather/src/common/models/location.dart';
import 'package:falconi_weather/src/common/models/weather_forecast.dart';
import 'package:falconi_weather/src/repositories/weather_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:stream_transform/stream_transform.dart';

part 'location_weather_event.dart';
part 'location_weather_state.dart';

const throttleDuration = Duration(milliseconds: 100);

// A transformer that throttles the events and drops the ones that are emitted while the previous event is still being processed.
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class LocationWeatherBloc extends Bloc<LocationWeatherEvent, LocationWeatherState> {
  LocationWeatherBloc(this._repository) : super(const LocationWeatherState()) {
    on<LocationWeatherEvent>(
      (event, emit) async {
        if (event is LocationWeatherRefreshedEvent) {
          return _onRefresh(event, emit);
        } else if (event is LocationWeatherFetchedEvent) {
          return _onFetchEvent(event, emit);
        } else if (event is LocationWeatherUnitChangedEvent) {
          return _onUnitChange(event, emit);
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final WeatherRepository _repository;

  void _onUnitChange(
    LocationWeatherUnitChangedEvent event,
    Emitter<LocationWeatherState> emit,
  ) {
    return emit(state.copyWith(unit: event.unit));
  }

  Future<void> _onRefresh(
    LocationWeatherRefreshedEvent event,
    Emitter<LocationWeatherState> emit,
  ) async {
    return await _fetch(state.location, state.unit, emit);
  }

  Future<void> _onFetchEvent(
    LocationWeatherFetchedEvent event,
    Emitter<LocationWeatherState> emit,
  ) async {
    return await _fetch(state.location, state.unit, emit);
  }

  Future<void> _fetch(
    Location location,
    Unit unit,
    Emitter<LocationWeatherState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LocationWeatherStateStatus.loading));
      final forecast = await _repository.fetchWeather(location.lat, location.lng);
      return emit(state.copyWith(
        status: LocationWeatherStateStatus.loaded,
        forecast: forecast,
      ));
    } on Exception catch (e) {
      return emit(state.copyWith(
        status: LocationWeatherStateStatus.error,
        error: e.toString(),
      ));
    }
  }
}
