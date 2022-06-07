import 'package:drift/drift.dart';

@DataClassName('LocationDataClass')
class LocationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get locationCode => text()();
  TextColumn get locationName => text()();
  // local create and update times.
  DateTimeColumn get localCreatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get localUpdatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
