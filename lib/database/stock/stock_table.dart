import 'package:drift/drift.dart';

@DataClassName('StockDataClass')
class StockTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get autoNumber => integer()();
  DateTimeColumn get transactionDate => dateTime()();
  TextColumn get itemcode => text()();
  TextColumn get itemname => text()();
  TextColumn get description => text()();
  TextColumn get batchnumber => text()();
  RealColumn get batchQauntity => real()();
  RealColumn get transactionQauntity => real()();
  RealColumn get cumulativeQauntity => real()();
  RealColumn get availableQuantity => real()();
  RealColumn get rate => real()();
  RealColumn get masterRate => real()();
  RealColumn get totalprice => real()();
  RealColumn get closing => real()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  // local create and update times.
  DateTimeColumn get localCreatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get localUpdatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  TextColumn get locationCode => text()();
  TextColumn get storecode => text()();
}
