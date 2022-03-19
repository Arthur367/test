// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      id: json['id'] as int?,
      storeCode_: json['store_id'] as String,
      storeName_: json['store_name'] as String,
      locationCode: json['location_code'] as String,
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_id': instance.storeCode_,
      'store_name': instance.storeName_,
      'location_code': instance.locationCode,
    };
