import 'package:drift/drift.dart';

@DataClassName('TransactionClass')
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
  BoolColumn get payComp => boolean().withDefault(const Constant(false))();
}
