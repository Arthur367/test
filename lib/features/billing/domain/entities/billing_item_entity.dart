import 'package:equatable/equatable.dart';

class BillingItemEntity extends Equatable {
  final int stockItemId;
  final double quantity;
  final double unitPrice;
  final double taxRate;
  final String stockItemCode;
  final double transactionQuantity;
  final String locationCode;
  final String storecode;
  final bool selected;
  final String customerId;

  const BillingItemEntity(
      {required this.quantity,
      required this.taxRate,
      required this.unitPrice,
      required this.stockItemId,
      required this.transactionQuantity,
      required this.stockItemCode,
      required this.selected,
      required this.locationCode,
      required this.customerId,
      required this.storecode});

  @override
  List<Object?> get props => [
        stockItemId,
        quantity,
        unitPrice,
        stockItemCode,
      ];
}
