import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final int autoNumber;
  final String productCode;
  final String productShortCode;
  final String productName;
  final double tax;
  final double costPrice;
  final double salesPrice;
  final double maxStock;
  final double minStock;
  final String vatType;
  final bool inclusiveTax;
  final bool isInclusive;
  final bool isBatch;
  final bool isExpDate;
  final bool isLot;
  final String barCode;
  final bool costVariance;
  final String taxTemplateId;

  const ProductEntity({
    required this.id,
    required this.autoNumber,
    required this.productCode,
    required this.productShortCode,
    required this.productName,
    required this.costPrice,
    required this.salesPrice,
    required this.tax,
    required this.maxStock,
    required this.minStock,
    required this.vatType,
    required this.inclusiveTax,
    required this.isInclusive,
    required this.isBatch,
    required this.isExpDate,
    required this.isLot,
    required this.barCode,
    required this.costVariance,
    required this.taxTemplateId,
  });

  @override
  List<Object?> get props => [
        id,
        autoNumber,
        productCode,
        productShortCode,
        productName,
        costPrice,
        salesPrice,
        tax,
        maxStock,
        minStock,
        vatType,
        inclusiveTax,
        isInclusive,
        isBatch,
        isExpDate,
        isLot,
        barCode,
        costVariance,
        taxTemplateId,
      ];

  @override
  bool get stringify => true;
}
