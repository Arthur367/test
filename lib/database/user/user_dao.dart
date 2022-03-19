import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
import 'user_table.dart';

part 'user_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  // table operations CRUD

  /// Inserts the user and returns the generated id.
  Future<int> insertUser(UserTableCompanion user) async {
    return await into(userTable)
        .insert(user)
        .onError((error, stackTrace) => throw DatabaseException());
  }

  /// Gets user from db by ID
  Future<UserDataClass?> selectUser() {
    return (select(userTable).getSingleOrNull());
  }
}
