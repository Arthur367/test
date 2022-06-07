import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/customers/customer_dao.dart';
import 'package:mobile_pos/database/customers/customer_table.dart';
import 'package:mobile_pos/database/token/token_dao.dart';
import 'package:mobile_pos/database/token/token_table.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'daos.dart';
import 'tables.dart';

part 'app_database.g.dart';

// this annotation tells drift to prepare a database class that uses the defined
// tables
@DriftDatabase(
  tables: [
    UserTable,
    StoreTable,
    LocationTable,
    ProductTable,
    VatTable,
    TaxTable,
    StockTable,
    BillingItemTable,
    TransactionTable,
    InvoiceTable,
    CustomerTable,
    TokenTable,
  ],
  daos: [
    UserDao,
    StoreDao,
    LocationDao,
    ProductDao,
    VatDao,
    TaxDao,
    StockDao,
    BillingItemDao,
    TransactionDao,
    InvoiceDao,
    CustomerDao,
    TokenDao,
  ],
)
@lazySingleton
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  @override
  int get schemaVersion => 8;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        // Runs after all the migrations but BEFORE any queries have a chance to execute
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (Migrator m) {
          return m.createAll();
        },
      );
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}
