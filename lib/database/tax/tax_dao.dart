import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
import 'tax_table.dart';

part 'tax_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [TaxTable])
class TaxDao extends DatabaseAccessor<AppDatabase> with _$TaxDaoMixin {
  TaxDao(AppDatabase db) : super(db);

  // table operations CRUD

  // returns the generated id
  Future<int> insertTax(TaxTableCompanion tax) async {
    return await into(taxTable)
        .insert(tax)
        .onError((error, stackTrace) => throw DatabaseException());
  }

  /// Insert multiple tax into tax table.
  Future<void> insertMultipleTax(List<TaxTableCompanion> taxes) async {
    await batch(
      (batch) => batch.insertAll(taxTable, taxes),
    ).onError((error, stackTrace) => DatabaseException());
  }
}
