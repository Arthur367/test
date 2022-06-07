import 'package:drift/drift.dart';

@DataClassName('InvoiceDataClass')
class InvoiceTable extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn get invoicenumber => text()();
  RealColumn get total => real().withDefault(const Constant(0.0))();
  RealColumn get tax => real().withDefault(const Constant(0.0))();
  RealColumn get subtotal => real().withDefault(const Constant(0.0))();
  TextColumn get customerId => text()();
  IntColumn get productId => integer()();
  RealColumn get quantity => real()();
  RealColumn get price => real()();
  TextColumn get invoiceId => text()();
  TextColumn get productCode => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get locationCode => text()();
  TextColumn get storecode => text()();
  RealColumn get taxPct => real().withDefault(const Constant(0.0))();
  RealColumn get availQty => real().withDefault(const Constant(0.0))();
}
