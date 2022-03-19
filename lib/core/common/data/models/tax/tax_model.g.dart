// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxModel _$TaxModelFromJson(Map<String, dynamic> json) => TaxModel(
      id: json['id'] as int?,
      autoNumber_: json['auto_number'] as int,
      taxId_: json['tax_id'] as String,
      taxName_: json['tax_name'] as String,
      taxPercent_: (json['tax_percent'] as num).toDouble(),
      excludeGoods_: json['exclude_goods'] as bool,
    );

Map<String, dynamic> _$TaxModelToJson(TaxModel instance) => <String, dynamic>{
      'id': instance.id,
      'auto_number': instance.autoNumber_,
      'tax_id': instance.taxId_,
      'tax_name': instance.taxName_,
      'tax_percent': instance.taxPercent_,
      'exclude_goods': instance.excludeGoods_,
    };
