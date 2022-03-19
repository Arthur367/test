// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as int?,
      autoNumber_: json['auto_number'] as int,
      productCode_: json['code'] as String,
      productShortCode_: json['short_code'] as String,
      productName_: json['product'] as String,
      costPrice_: ProductModel._stringToDouble(json['cost_price'] as String),
      salesPrice_: ProductModel._stringToDouble(json['sales_price'] as String),
      tax_: ProductModel._stringToDouble(json['tax'] as String),
      maxStock_: (json['max_stock'] as num).toDouble(),
      minStock_: (json['min_stock'] as num).toDouble(),
      vatType_: json['vat_type'] as String,
      inclusiveTax_: json['inclusive_tax'] as bool,
      isInclusive_: json['is_inclusive'] as bool,
      isBatch_: json['is_batch'] as bool,
      isExpDate_: json['is_exp_date'] as bool,
      isLot_: json['is_lot'] as bool,
      barCode_: json['bar_code'] as String,
      costVariance_: json['cost_variance'] as bool,
      taxTemplateId_: json['tax_template_id'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'auto_number': instance.autoNumber_,
      'code': instance.productCode_,
      'short_code': instance.productShortCode_,
      'product': instance.productName_,
      'tax': ProductModel._stringFromDouble(instance.tax_),
      'cost_price': ProductModel._stringFromDouble(instance.costPrice_),
      'sales_price': ProductModel._stringFromDouble(instance.salesPrice_),
      'max_stock': instance.maxStock_,
      'min_stock': instance.minStock_,
      'vat_type': instance.vatType_,
      'inclusive_tax': instance.inclusiveTax_,
      'is_inclusive': instance.isInclusive_,
      'is_batch': instance.isBatch_,
      'is_exp_date': instance.isExpDate_,
      'is_lot': instance.isLot_,
      'bar_code': instance.barCode_,
      'cost_variance': instance.costVariance_,
      'tax_template_id': instance.taxTemplateId_,
    };
