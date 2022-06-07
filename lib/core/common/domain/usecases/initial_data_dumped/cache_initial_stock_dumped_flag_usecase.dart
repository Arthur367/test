import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../repositories/repositories.dart';

@lazySingleton
class CacheInitialStockDumpedFlagUseCase implements UseCase<void, FlagParams> {
  final StockDataDumpedRepository _stockDataDumpedRepository;

  const CacheInitialStockDumpedFlagUseCase(this._stockDataDumpedRepository);

  @override
  Future<Either<Failure, void>> call(FlagParams params) async {
    return await _stockDataDumpedRepository
        .cacheInitialStockDumpedFlag(params.flag);
  }
}
