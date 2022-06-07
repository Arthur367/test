import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/product/product_dao.dart';
import 'package:mobile_pos/database/stock/stock_dao.dart';
import 'package:mobile_pos/database/transaction/transaction_dao.dart';

class InvoiceDocuments {
  final StockDataClass productDataClass;
  final TransactionDataClass transactions;

  InvoiceDocuments(
      {required this.productDataClass, required this.transactions});
}
