import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
import 'location_table.dart';

part 'location_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [LocationTable])
class LocationDao extends DatabaseAccessor<AppDatabase>
    with _$LocationDaoMixin {
  LocationDao(AppDatabase db) : super(db);

  // table operations CRUD

  // returns the generated id
  Future<int> insertLocation(LocationTableCompanion location) async {
    return await into(locationTable)
        .insert(location)
        .onError((error, stackTrace) => throw DatabaseException());
  }
}
