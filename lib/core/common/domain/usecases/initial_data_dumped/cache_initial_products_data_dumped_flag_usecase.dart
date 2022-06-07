import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../repositories/repositories.dart';

@lazySingleton
class CacheInitialProductsDataDumpedFlagUseCase
    implements UseCase<void, FlagParams> {
  final ProductsDataDumpedRepository _productsDataDumpedRepository;

  const CacheInitialProductsDataDumpedFlagUseCase(
      this._productsDataDumpedRepository);

  @override
  Future<Either<Failure, void>> call(FlagParams params) async {
    return await _productsDataDumpedRepository
        .cacheInitialProductsDataDumpedFlag(params.flag);
  }
}
