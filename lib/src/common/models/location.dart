import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Location extends Equatable {
  final double lat;
  final double lng;
  final String name;

  const Location({
    required this.lat,
    required this.lng,
    required this.name,
  });

  Location copyWith({
    double? lat,
    double? lng,
    String? name,
  }) =>
      Location(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        name: name ?? this.name,
      );

  @override
  List<Object?> get props => [
        lat,
        lng,
        name,
      ];
}
