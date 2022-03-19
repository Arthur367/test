// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockModel _$StockModelFromJson(Map<String, dynamic> json) => StockModel(
      id: json['id'] as int?,
      availableQuantity: (json['availableQuantity'] as num?)?.toDouble(),
      autoNumber_: json['auto_number'] as int,
      transactionDate_: DateTime.parse(json['transaction_date'] as String),
      batchQuantity_:
          StockModel._stringToDouble(json['batch_quantity'] as String),
      transactionQuantity_:
          StockModel._stringToDouble(json['transaction_quantity'] as String),
      cumulativeQuantity_:
          StockModel._stringToDouble(json['cum_quantity'] as String),
      createdAt_: DateTime.parse(json['created_at'] as String),
      updatedAt_: DateTime.parse(json['updated_at'] as String),
      masterRate_: StockModel._stringToDouble(json['master_rate'] as String),
      itemcode: json['itemcode'] as String,
      itemname: json['itemname'] as String,
      description: json['description'] as String,
      batchnumber: json['batchnumber'] as String,
      rate_: StockModel._stringToDouble(json['rate'] as String),
      totalprice_: StockModel._stringToDouble(json['totalprice'] as String),
      closing_: StockModel._stringToDouble(json['closing'] as String),
    );

Map<String, dynamic> _$StockModelToJson(StockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemcode': instance.itemcode,
      'itemname': instance.itemname,
      'description': instance.description,
      'batchnumber': instance.batchnumber,
      'availableQuantity': instance.availableQuantity,
      'auto_number': instance.autoNumber_,
      'transaction_date': instance.transactionDate_.toIso8601String(),
      'batch_quantity': StockModel._stringFromDouble(instance.batchQuantity_),
      'transaction_quantity':
          StockModel._stringFromDouble(instance.transactionQuantity_),
      'cum_quantity':
          StockModel._stringFromDouble(instance.cumulativeQuantity_),
      'master_rate': StockModel._stringFromDouble(instance.masterRate_),
      'rate': StockModel._stringFromDouble(instance.rate_),
      'totalprice': StockModel._stringFromDouble(instance.totalprice_),
      'closing': StockModel._stringFromDouble(instance.closing_),
      'created_at': instance.createdAt_.toIso8601String(),
      'updated_at': instance.updatedAt_.toIso8601String(),
    };
