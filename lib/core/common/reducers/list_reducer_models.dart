class BillingModel {
  final String name, productId;
  final double tax;
  final bool isIncluded;
  final double rate, quantity;

  BillingModel({
    required this.name,
    required this.tax,
    required this.productId,
    required this.isIncluded,
    required this.rate,
    required this.quantity,
  });
}

class TransactionModel {
  final String name, stockId;
  final double tax;
  final bool isIncluded;
  final double rate, quantity;

  TransactionModel({
    required this.name,
    required this.tax,
    required this.stockId,
    required this.isIncluded,
    required this.rate,
    required this.quantity,
  });
}
