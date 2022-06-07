import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/error/exceptions.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/customers/customer_table.dart';

part 'customer_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [CustomerTable])
class CustomerDao extends DatabaseAccessor<AppDatabase>
    with _$CustomerDaoMixin {
  CustomerDao(AppDatabase database) : super(database);
  Future<void> insertMultiple(List<CustomerTableCompanion> customers) async {
    await batch(
      (batch) => batch.insertAll(customerTable, customers),
    ).onError((error, stackTrace) => DatabaseException());
  }

  Stream<List<CustomerClass>> getCustomers() {
    return (select(customerTable)).watch();
  }

  Future<void> getCustomer(String id) {
    return (select(customerTable)..where((tbl) => tbl.customerId.equals(id)))
        .getSingle()
        .onError((error, stackTrace) => throw DatabaseException());
  }

  Future<void> deleteCustomer() {
    return (delete(customerTable))
        .go()
        .onError((error, stackTrace) => throw DatabaseException());
  }
}
