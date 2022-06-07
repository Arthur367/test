import 'package:drift/drift.dart';

@DataClassName('TaxDataClass')
class TaxTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get autoNumber => integer()();
  TextColumn get taxId => text()();
  TextColumn get taxName => text()();
  RealColumn get taxPercent => real()();
  BoolColumn get excludeGoods => boolean()();
  // local create and update times.
  DateTimeColumn get localCreatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get localUpdatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
