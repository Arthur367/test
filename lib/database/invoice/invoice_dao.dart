import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/invoice/invoice_documents.dart';
import 'package:mobile_pos/database/invoice/invoice_table.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
part 'invoice_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [InvoiceTable])
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

  Future<void> getInvoice(String id) {
    return (select(invoiceTable)..where((i) => i.invoicenumber.equals(id)))
        .getSingleOrNull()
        .onError((error, stackTrace) => throw DatabaseException());
  }

//display customer names for according to customerName

}
