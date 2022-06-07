import 'package:dartz/dartz.dart';

import '../../../../error/failures.dart';

abstract class ProductsDataDumpedRepository {
  /// Cache information on intial stock was dumped
  /// This occurs on app first install
  Future<Either<Failure, void>> cacheInitialProductsDataDumpedFlag(bool flag);

  /// Get status of cache data dumped
  Future<Either<Failure, bool?>> isInitialProductsDataDumped();
}
