import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final int? id;
  final String locationCode;
  final String locationName;

  const LocationEntity({
    required this.id,
    required this.locationCode,
    required this.locationName,
  });

  @override
  List<Object?> get props => [id, locationCode, locationName];
}
