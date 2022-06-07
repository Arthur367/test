import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel extends StoreEntity {
  @JsonKey(name: 'store_id')
  final String storeCode_;
  @JsonKey(name: 'store_name')
  final String storeName_;
  @JsonKey(name: 'location_code')
  final String locationCode;

  const StoreModel({
    int? id,
    required this.storeCode_,
    required this.storeName_,
    required this.locationCode,
  }) : super(
          id: id,
          storeCode: storeCode_,
          storeName: storeName_,
          storeLocationCode: locationCode,
        );

  factory StoreModel.fromJson(Map<String, dynamic> data) =>
      _$StoreModelFromJson(data);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
