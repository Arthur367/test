import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
import 'store_table.dart';

part 'store_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [StoreTable])
class StoreDao extends DatabaseAccessor<AppDatabase> with _$StoreDaoMixin {
  StoreDao(AppDatabase db) : super(db);

  // table operations CRUD

  // returns the generated id
  Future<int> insertStore(StoreTableCompanion store) async {
    return await into(storeTable)
        .insert(store)
        .onError((error, stackTrace) => throw DatabaseException());
  }

  Future getStore() {
    return select(storeTable).get();
  }

  Future<void> deleteStore() {
    return (delete(storeTable))
        .go()
        .onError((error, stackTrace) => throw DatabaseException());
  }
}
