import 'package:drift/drift.dart';

@DataClassName('CustomerClass')
class CustomerTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get customerId => text()();
  TextColumn get customerName => text()();
}
