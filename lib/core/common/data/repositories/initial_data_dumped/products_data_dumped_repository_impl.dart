import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../domain/repositories/repositories.dart';
import '../../datasources/datasources.dart';

@LazySingleton(as: ProductsDataDumpedRepository)
class ProductsDataDumpedRepositoryImpl implements ProductsDataDumpedRepository {
  final InitialDataDumpCacheDataSource _initialDataDumpCacheDataSource;

  const ProductsDataDumpedRepositoryImpl(this._initialDataDumpCacheDataSource);

  @override
  Future<Either<Failure, void>> cacheInitialProductsDataDumpedFlag(
      bool flag) async {
    try {
      return Right(await _initialDataDumpCacheDataSource
          .setInitialProductsDumpedStatus(flag));
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool?>> isInitialProductsDataDumped() async {
    try {
      return Right(await _initialDataDumpCacheDataSource
          .getInitialProductsDumpedStatus());
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
