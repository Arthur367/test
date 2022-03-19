// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VatModel _$VatModelFromJson(Map<String, dynamic> json) => VatModel(
      id: json['id'] as int?,
      autoNumber_: json['auto_number'] as int,
      vatId_: json['vat_id'] as String,
      vatName_: json['vat'] as String,
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$VatModelToJson(VatModel instance) => <String, dynamic>{
      'id': instance.id,
      'flag': instance.flag,
      'auto_number': instance.autoNumber_,
      'vat_id': instance.vatId_,
      'vat': instance.vatName_,
    };
