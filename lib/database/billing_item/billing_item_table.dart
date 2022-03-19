import 'package:drift/drift.dart';

@DataClassName('BillingItemClass')
class BillingItemTable extends Table {
  // primary key of stock from stocktable
  IntColumn get stockItemId => integer()();
  // quantity user selected insert a value 1.0 as default.
  RealColumn get quantity => real().withDefault(const Constant(1.0))();

  RealColumn get unitPrice => real().withDefault(const Constant(1.0))();

  @override
  Set<Column> get primaryKey => {stockItemId};
}
