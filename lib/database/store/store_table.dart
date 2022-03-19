import 'package:drift/drift.dart';

@DataClassName('StoreDataClass')
class StoreTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get storeCode => text()();
  TextColumn get storeName => text()();
  // local create and update times.
  DateTimeColumn get localCreatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get localUpdatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
