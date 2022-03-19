import 'package:drift/drift.dart';

@DataClassName('ProductDataClass')
class ProductTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get autoNumber => integer()();
  TextColumn get productCode => text()();
  TextColumn get productShortCode => text()();
  TextColumn get productName => text()();
  RealColumn get costPrice => real()();
  RealColumn get salesPrice => real()();
  RealColumn get tax => real()();
  RealColumn get minStock => real()();
  RealColumn get maxStock => real()();
  TextColumn get vatType => text()();
  BoolColumn get inclusiveTax => boolean()();
  BoolColumn get isInclusive => boolean()();
  BoolColumn get isBatch => boolean()();
  BoolColumn get isExpDate => boolean()();
  BoolColumn get isLot => boolean()();
  TextColumn get barCode => text()();
  BoolColumn get costVariance => boolean()();
  TextColumn get taxTemplateId => text()();

  // local create and update times.
  DateTimeColumn get localCreatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get localUpdatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
