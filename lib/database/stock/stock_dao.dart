import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
import '../tables.dart';

part 'stock_dao.g.dart';

/// Stock table operations CRUD

@lazySingleton
@DriftAccessor(tables: [StockTable])
class StockDao extends DatabaseAccessor<AppDatabase> with _$StockDaoMixin {
  StockDao(AppDatabase db) : super(db);

  /// returns the generated id
  Future<int> insertStock(StockTableCompanion stock) async {
    return await into(stockTable)
        .insert(stock)
        .onError((error, stackTrace) => throw DatabaseException());
  }

  Future<void> updateStock(StockTableCompanion stock) async {
    await update(stockTable).replace(stock).onError((error, stackTrace) {
      throw DatabaseException();
    });
  }

  /// Insert multiple stock into stocks table.
  Future<void> insertMultipleStock(List<StockTableCompanion> stocks) async {
    await batch((batch) => batch.insertAll(stockTable, stocks))
        .onError((error, stackTrace) => DatabaseException());
  }

  Future showAllStock() {
    return (select(stockTable)).get();
  }

  Future<List<StockDataClass>> shownSmallStock() {
    return (select(stockTable)
          ..where((tbl) => tbl.transactionQauntity.isSmallerOrEqualValue(10)))
        .get();
  }

  /// Fetch all stock dataname
  Future<List<StockDataClass>> selectAllStock() => select(stockTable).get();

  Future<void> deleteAllItems() {
    return (delete(stockTable))
        .go()
        .onError((error, stackTrace) => throw DatabaseException());
  }
}
