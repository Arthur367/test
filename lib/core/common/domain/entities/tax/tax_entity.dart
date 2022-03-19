import 'package:equatable/equatable.dart';

class TaxEntity extends Equatable {
  final int? id;
  final int autoNumber;
  final String taxId;
  final String taxName;
  final double taxPercent;
  final bool excludeGoods;

  const TaxEntity({
    required this.id,
    required this.autoNumber,
    required this.taxId,
    required this.taxName,
    required this.taxPercent,
    required this.excludeGoods,
  });

  @override
  List<Object?> get props => [
        id,
        autoNumber,
        taxId,
        taxName,
        taxPercent,
        excludeGoods,
      ];

  @override
  bool get stringify => true;
}
