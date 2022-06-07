import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
import 'vat_table.dart';

part 'vat_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [VatTable])
class VatDao extends DatabaseAccessor<AppDatabase> with _$VatDaoMixin {
  VatDao(AppDatabase db) : super(db);

  // table operations CRUD

  // returns the generated id
  Future<int> insertVat(VatTableCompanion vat) async {
    return await into(vatTable)
        .insert(vat)
        .onError((error, stackTrace) => throw DatabaseException());
  }

  /// Insert multiple vat into vat table
  Future<void> insertMultipleVat(List<VatTableCompanion> vats) async {
    await batch(
      (batch) => batch.insertAll(vatTable, vats),
    ).onError((error, stackTrace) => DatabaseException());
  }
}
