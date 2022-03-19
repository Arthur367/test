import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../domain/repositories/repositories.dart';
import '../../datasources/datasources.dart';

@LazySingleton(as: VatTaxDataDumpedRepository)
class VatTaxDataDumpedRepositoryImpl implements VatTaxDataDumpedRepository {
  final InitialDataDumpCacheDataSource _initialDataDumpCacheDataSource;

  const VatTaxDataDumpedRepositoryImpl(this._initialDataDumpCacheDataSource);

  @override
  Future<Either<Failure, void>> cacheInitialVatTaxDumpedFlag(bool flag) async {
    try {
      return Right(await _initialDataDumpCacheDataSource
          .setInitialVatTaxDumpedStatus(flag));
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool?>> isInitialVatTaxDumped() async {
    try {
      return Right(
          await _initialDataDumpCacheDataSource.getInitialVatTaxDumpedStatus());
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
