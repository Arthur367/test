import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  @JsonKey(name: 'auto_number')
  final int autoNumber_;
  @JsonKey(name: 'code')
  final String productCode_;
  @JsonKey(name: 'short_code')
  final String productShortCode_;
  @JsonKey(name: 'product')
  final String productName_;
  @JsonKey(
    name: 'tax',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double tax_;
  @JsonKey(
    name: 'cost_price',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double costPrice_;
  @JsonKey(
    name: 'sales_price',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double salesPrice_;
  @JsonKey(name: 'max_stock')
  final double maxStock_;
  @JsonKey(name: 'min_stock')
  final double minStock_;
  @JsonKey(name: 'vat_type')
  final String vatType_;
  @JsonKey(name: 'inclusive_tax')
  final bool inclusiveTax_;
  @JsonKey(name: 'is_inclusive')
  final bool isInclusive_;
  @JsonKey(name: 'is_batch')
  final bool isBatch_;
  @JsonKey(name: 'is_exp_date')
  final bool isExpDate_;
  @JsonKey(name: 'is_lot')
  final bool isLot_;
  @JsonKey(name: 'bar_code')
  final String barCode_;
  @JsonKey(name: 'cost_variance')
  final bool costVariance_;
  @JsonKey(name: 'tax_template_id')
  final String taxTemplateId_;

  const ProductModel({
    int? id,
    required this.autoNumber_,
    required this.productCode_,
    required this.productShortCode_,
    required this.productName_,
    required this.costPrice_,
    required this.salesPrice_,
    required this.tax_,
    required this.maxStock_,
    required this.minStock_,
    required this.vatType_,
    required this.inclusiveTax_,
    required this.isInclusive_,
    required this.isBatch_,
    required this.isExpDate_,
    required this.isLot_,
    required this.barCode_,
    required this.costVariance_,
    required this.taxTemplateId_,
  }) : super(
          id: id,
          autoNumber: autoNumber_,
          productCode: productCode_,
          productShortCode: productShortCode_,
          productName: productName_,
          costPrice: costPrice_,
          salesPrice: salesPrice_,
          tax: tax_,
          maxStock: maxStock_,
          minStock: minStock_,
          vatType: vatType_,
          inclusiveTax: inclusiveTax_,
          isInclusive: isInclusive_,
          isBatch: isBatch_,
          isExpDate: isExpDate_,
          isLot: isLot_,
          barCode: barCode_,
          costVariance: costVariance_,
          taxTemplateId: taxTemplateId_,
        );

  factory ProductModel.fromJson(Map<String, dynamic> data) =>
      _$ProductModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  /// converts some string values to double to be able to work
  /// with locally. API response is of String type.
  static int _stringToInt(String number) => int.parse(number);
  static String _stringFromInt(int number) => number.toString();

  static double _stringToDouble(String number) => double.parse(number);
  static String _stringFromDouble(double number) => number.toString();
}
