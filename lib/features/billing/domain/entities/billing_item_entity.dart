import 'package:equatable/equatable.dart';

class BillingItemEntity extends Equatable {
  final int stockItemId;
  final double quantity;
  final double unitPrice;
  final double taxRate;
  final String stockItemCode;
  final double availableQuantity;
  final bool selected;

  const BillingItemEntity(
      {required this.quantity,
      required this.taxRate,
      required this.unitPrice,
      required this.stockItemId,
      required this.availableQuantity,
      required this.stockItemCode,
      required this.selected});

  @override
  List<Object?> get props => [
        stockItemId,
        quantity,
        unitPrice,
        stockItemCode,
      ];
}
