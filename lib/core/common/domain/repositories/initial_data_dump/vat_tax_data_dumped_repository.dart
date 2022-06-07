import 'package:dartz/dartz.dart';

import '../../../../error/failures.dart';

abstract class VatTaxDataDumpedRepository {
  /// Cache information on intial vat and tax data was dumped
  /// This occurs on app first install
  Future<Either<Failure, void>> cacheInitialVatTaxDumpedFlag(bool flag);

  /// Get status of cache data dumped
  Future<Either<Failure, bool?>> isInitialVatTaxDumped();
}
