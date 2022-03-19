import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends LocationEntity {
  @JsonKey(name: 'loc_id')
  final String locationCode_;
  final String location;

  const LocationModel({
    int? id,
    required this.locationCode_,
    required this.location,
  }) : super(
          id: id,
          locationCode: locationCode_,
          locationName: location,
        );

  factory LocationModel.fromJson(Map<String, dynamic> data) =>
      _$LocationModelFromJson(data);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
