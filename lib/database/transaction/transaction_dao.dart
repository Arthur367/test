import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/transaction/transaction_details.dart';
import 'package:mobile_pos/database/transaction/transaction_table.dart';
import 'package:mobile_pos/database/transaction/transactioned_items.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
part 'transaction_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [TransactionTable])
class TransactionDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionDaoMixin {
  TransactionDao(AppDatabase database) : super(database);

  Future<int> insert(TransactionTableCompanion transaction) async {
    return into(transactionTable)
        .insertOnConflictUpdate(transaction)
        .onError((error, stackTrace) => throw DatabaseException());
  }

  Future<List<TransactionClass>> getTransactions() {
    return (select(transactionTable)).get();
  }

  Future<void> getTransaction(String id) {
    return (select(transactionTable)..where((i) => i.transactionId.equals(id)))
        .getSingleOrNull()
        .onError((error, stackTrace) => throw DatabaseException());
  }

  Future<List<TransactionItems>> transactionItems(
      List<int> stockItemIds) async {
    final query = select(billingTable).join([
      innerJoin(stockTable, stockTable.id.equalsExp(billingTable.stockItemId)),
    ])
      ..where(billingTable.stockItemId.isIn(stockItemIds));
    final result = await query.get();

    return result
        .map((row) => TransactionItems(
              billingItems: row.readTable(billingTable),
              stockDataClass: row.readTable(stockTable),
            ))
        .toList();
  }

  //Read CustomerDetails
  Future<List<TransactionDetails>> transactionDetails(
      List<String> invoiceId) async {
    final query = select(transactionTable).join([
      innerJoin(invoiceTable,
          invoiceTable.invoiceId.equalsExp(transactionTable.invoiceId))
    ]);
    final result = await query.get();

    return result
        .map((e) => TransactionDetails(
              invoiceData: e.readTable(invoiceTable),
            ))
        .toList();
  }
}
