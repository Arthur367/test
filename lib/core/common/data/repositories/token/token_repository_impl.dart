import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../domain/entities/token/token_entity.dart';
import '../../../domain/repositories/repositories.dart';
import '../../datasources/datasources.dart';
import '../../models/models.dart';

@LazySingleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  final TokenCacheDataSource _tokenCacheDataSource;

  const TokenRepositoryImpl(this._tokenCacheDataSource);

  @override
  Future<Either<Failure, void>> cacheToken(String token) async {
    try {
      final TokenModel _tokenModel = TokenModel(token: token);
      return Right(await _tokenCacheDataSource.cacheToken(_tokenModel));
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, TokenEntity>> getUserToken() async {
    try {
      return Right(await _tokenCacheDataSource.getToken());
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> clearToken() async {
    try {
      return Right(await _tokenCacheDataSource.clearToken());
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
