import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/error/exceptions.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/token/token_table.dart';

part 'token_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [TokenTable])
class TokenDao extends DatabaseAccessor<AppDatabase> with _$TokenDaoMixin {
  TokenDao(AppDatabase db) : super(db);

  Future<int> insert(TokenTableCompanion token) {
    return into(tokenTable)
        .insert(token)
        .onError((error, stackTrace) => throw DatabaseException());
  }
}
