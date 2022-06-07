import 'package:drift/drift.dart';

@DataClassName('VatDataClass')
class VatTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get autoNumber => integer()();
  TextColumn get vatId => text()();
  TextColumn get vatName => text()();
  TextColumn get flag => text()();
  // local create and update times.
  DateTimeColumn get localCreatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get localUpdatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
