import 'package:dartz/dartz.dart';

import '../../../../error/failures.dart';
import '../../entities/entities.dart';

abstract class TokenRepository {
  /// cache user token
  Future<Either<Failure, void>> cacheToken(String token);

  /// Get user token
  Future<Either<Failure, TokenEntity>> getUserToken();

  /// clear token Usually after a logout event
  Future<Either<Failure, void>> clearToken();
}
