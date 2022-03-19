import 'package:drift/drift.dart';

@DataClassName('UserDataClass')
class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get userCode => text()();
  TextColumn get username => text()();
  TextColumn get password => text()();
  // local create and update times.
  DateTimeColumn get localCreatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get localUpdatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
