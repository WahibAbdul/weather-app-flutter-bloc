import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:falconi_weather/src/common/models/location.dart';
import 'package:falconi_weather/src/repositories/weather_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:open_weather_api/open_weather_api.dart';
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
    on<LocationWeatherEvent>((event, emit) {
      if (event is LocationWeatherRefreshedEvent) {
        _onRefresh(event, emit);
      } else if (event is LocationWeatherFetchedEvent) {
        _onFetchEvent(event, emit);
      }
    });
  }

  final WeatherRepository _repository;

  void _onRefresh(
    LocationWeatherRefreshedEvent event,
    Emitter<LocationWeatherState> emit,
  ) {
    _fetch(state.location, state.unit, emit);
  }

  void _onFetchEvent(
    LocationWeatherFetchedEvent event,
    Emitter<LocationWeatherState> emit,
  ) {
    _fetch(state.location, state.unit, emit);
  }

  Future<void> _fetch(
    Location location,
    WeatherUnit unit,
    Emitter<LocationWeatherState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LocationWeatherStateStatus.loading));
      final weather = await _repository.fetchWeather(
        location.lat,
        location.lng,
        unit: unit,
      );
      emit(state.copyWith(
        status: LocationWeatherStateStatus.loaded,
        weather: weather,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: LocationWeatherStateStatus.error,
        error: e.toString(),
      ));
    }
  }
}
