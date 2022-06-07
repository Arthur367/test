import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../domain/repositories/repositories.dart';
import '../../datasources/datasources.dart';

@LazySingleton(as: StockDataDumpedRepository)
class StockDataDumpedRepositoryImpl implements StockDataDumpedRepository {
  final InitialDataDumpCacheDataSource _initialDataDumpCacheDataSource;

  const StockDataDumpedRepositoryImpl(this._initialDataDumpCacheDataSource);

  @override
  Future<Either<Failure, void>> cacheInitialStockDumpedFlag(bool flag) async {
    try {
      return Right(await _initialDataDumpCacheDataSource
          .setInitialStockDumpedStatus(flag));
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool?>> isInitialStockDumped() async {
    try {
      return Right(
          await _initialDataDumpCacheDataSource.getInitialStockDumpedStatus());
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
