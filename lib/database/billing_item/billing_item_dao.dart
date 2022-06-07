import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/customers/customer_table.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
import '../tables.dart';

part 'billing_item_dao.g.dart';

/// Billing item table operations CRUD
@lazySingleton
@DriftAccessor(tables: [BillingItemTable, CustomerTable])
class BillingItemDao extends DatabaseAccessor<AppDatabase>
    with _$BillingItemDaoMixin {
  BillingItemDao(AppDatabase db) : super(db);

  /// inserts new item into db or updates it if it exists.
  /// the update will update the quantity.
  Future<void> insertOrUpdateItem(BillingItemTableCompanion item) {
    return into(billingItemTable)
        .insertOnConflictUpdate(item)
        .onError((error, stackTrace) => throw DatabaseException());
  }

  /// retrieve billing items.
  Future<List<BillingItemClass>> getBillingItems() {
    return (select(billingItemTable)).get();
  }

  Stream<List<BillingItemClass>> watchBillingItems() =>
      select(billingItemTable).watch();

//retreive one billing item;
  Future<void> getBillingItem(int itemId) {
    return (select(billingItemTable)
          ..where((tbl) => tbl.stockItemId.equals(itemId)))
        .getSingleOrNull()
        .onError((error, stackTrace) => throw DatabaseException());
  }

  /// remove item from billing items
  Future<void> deleteItem(int itemId) {
    return (delete(billingItemTable)
          ..where((i) => i.stockItemId.equals(itemId)))
        .go()
        .onError((error, stackTrace) => throw DatabaseException());
  }

  //update billingItems

//Get location and store details

  /// Remove all items from billing items table
  Future<void> deleteAllItems() {
    return (delete(billingItemTable))
        .go()
        .onError((error, stackTrace) => throw DatabaseException());
  }
}
