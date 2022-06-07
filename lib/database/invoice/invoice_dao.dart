import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/invoice/invoice_documents.dart';
import 'package:mobile_pos/database/invoice/invoice_table.dart';
import 'package:mobile_pos/database/invoice/product_quantity.dart';
import 'package:mobile_pos/database/tables.dart';
import 'package:mobile_pos/database/transaction/transaction_details.dart';
import 'package:mobile_pos/database/transaction/transactioned_items.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
part 'invoice_dao.g.dart';

@lazySingleton
@DriftAccessor(
    tables: [InvoiceTable, TransactionTable, ProductTable, StockTable])
class InvoiceDao extends DatabaseAccessor<AppDatabase> with _$InvoiceDaoMixin {
  InvoiceDao(AppDatabase database) : super(database);

  Future<void> insertMultiple(List<InvoiceTableCompanion> invoice) async {
    return await batch(
      (batch) => batch.insertAll(invoiceTable, invoice),
    ).onError((error, stackTrace) => DatabaseException());
  }

  Future<List<InvoiceDataClass>> getInvoices() {
    return (select(invoiceTable)).get();
  }

  Future<List<TransactionItems>> getItems(String id) async {
    final query = select(stockTable).join([
      innerJoin(invoiceTable,
          invoiceTable.productCode.equalsExp(stockTable.itemcode)),
      innerJoin(transactionTable,
          transactionTable.invoiceId.equalsExp(invoiceTable.invoiceId))
    ])
      ..where(invoiceTable.invoiceId.equals(id));

    final result = await query.get();
    return result
        .map((e) => TransactionItems(
            stocks: e.readTable(stockTable),
            transactions: e.readTable(transactionTable),
            invoices: e.readTable(invoiceTable)))
        .toList();
  }

  Future<List<TransactionItems>> getTransaction(String id) async {
    final query = select(stockTable).join([
      innerJoin(invoiceTable,
          invoiceTable.productCode.equalsExp(stockTable.itemcode)),
      innerJoin(transactionTable,
          transactionTable.invoiceId.equalsExp(invoiceTable.invoiceId))
    ])
      ..where(transactionTable.paymentMethod.equals(id));

    final result = await query.get();
    return result
        .map((e) => TransactionItems(
            stocks: e.readTable(stockTable),
            transactions: e.readTable(transactionTable),
            invoices: e.readTable(invoiceTable)))
        .toList();
  }

  Future<List<TransactionItems>> getAllItems() async {
    final query = select(stockTable).join([
      innerJoin(invoiceTable,
          invoiceTable.productCode.equalsExp(stockTable.itemcode)),
      innerJoin(transactionTable,
          transactionTable.invoiceId.equalsExp(invoiceTable.invoiceId))
    ]);

    final result = await query.get();
    return result
        .map((e) => TransactionItems(
            stocks: e.readTable(stockTable),
            transactions: e.readTable(transactionTable),
            invoices: e.readTable(invoiceTable)))
        .toList();
  }

  Future<List<TransactionItems>> getTodayItems(int id) async {
    final query = select(stockTable).join([
      innerJoin(invoiceTable,
          invoiceTable.productCode.equalsExp(stockTable.itemcode)),
      innerJoin(transactionTable,
          transactionTable.invoiceId.equalsExp(invoiceTable.invoiceId))
    ])
      ..where(invoiceTable.createdAt.day.equals(id));

    final result = await query.get();
    return result
        .map((e) => TransactionItems(
            stocks: e.readTable(stockTable),
            transactions: e.readTable(transactionTable),
            invoices: e.readTable(invoiceTable)))
        .toList();
  }

  Future<List<InvoiceDataClass>> getToday(int picked) {
    return (select(invoiceTable)
          ..where((tbl) => tbl.createdAt.day.equals(picked)))
        .get();
  }

  // Future<List<TransactionItems>> getItems(List<int> itemIds) async {
  //   final query = select(stockTable).join([
  //     innerJoin(
  //         invoiceTable, invoiceTable.productCode.equalsExp(stockTable.itemcode))
  //   ])
  //     ..where(stockTable.id.isIn(itemIds));

  //   final result = await query.get();
  //   return result
  //       .map((row) =>
  //           TransactionItems(stockDataClass: row.readTable(stockTable)))
  //       .toList();
  // }

  Future<void> getInvoice(String id) {
    return (select(invoiceTable)..where((i) => i.invoicenumber.equals(id)))
        .getSingleOrNull()
        .onError((error, stackTrace) => throw DatabaseException());
  }

  Future<List<ProductQuantity>> getStockAtHand() async {
    final query = select(stockTable).join([
      innerJoin(
          invoiceTable, invoiceTable.productCode.equalsExp(stockTable.itemcode))
    ]);
    final result = await query.get();
    return result
        .map((row) => ProductQuantity(
              stocks: row.readTable(stockTable),
            ))
        .toList();
  }

//display customer names for according to customerName

}
