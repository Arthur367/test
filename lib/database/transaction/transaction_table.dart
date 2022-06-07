import 'package:drift/drift.dart';

@DataClassName('TransactionDataClass')
class TransactionTable extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn get transactionId => text()();
  RealColumn get total => real().withDefault(const Constant(0.0))();
  RealColumn get tax => real().withDefault(const Constant(0.0))();
  RealColumn get subtotal => real().withDefault(const Constant(0.0))();
  TextColumn get customerId => text()();
  TextColumn get customerName => text()();
  TextColumn get customerEmail => text()();
  IntColumn get customerPhone => integer()();
  TextColumn get invoiceId => text()();
  TextColumn get paymentMethod => text()();
  TextColumn get payComp => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get locationCode => text()();
  TextColumn get storecode => text()();
}
