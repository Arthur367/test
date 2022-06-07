import 'package:mobile_pos/database/app_database.dart';

class TransactionItems {
  final StockDataClass stocks;
  final TransactionDataClass transactions;
  final InvoiceDataClass invoices;

  TransactionItems(
      {required this.stocks,
      required this.transactions,
      required this.invoices});
}
