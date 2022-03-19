import 'package:mobile_pos/database/app_database.dart';

class TransactionItems {
  final BillingItemClass billingItems;
  final StockDataClass stockDataClass;

  TransactionItems({
    required this.billingItems,
    required this.stockDataClass,
  });
}
