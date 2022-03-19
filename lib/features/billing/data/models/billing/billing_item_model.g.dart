// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingItemModel _$BillingItemModelFromJson(Map<String, dynamic> json) =>
    BillingItemModel(
      quantity: (json['quantity'] as num?)?.toDouble(),
      taxRate: (json['taxRate'] as num?)?.toDouble(),
      stockItemId: json['stockItemId'] as int,
      stockItemCode: json['stockItemCode'] as String,
    );

Map<String, dynamic> _$BillingItemModelToJson(BillingItemModel instance) =>
    <String, dynamic>{
      'stockItemId': instance.stockItemId,
      'quantity': instance.quantity,
      'taxRate': instance.taxRate,
      'stockItemCode': instance.stockItemCode
    };
