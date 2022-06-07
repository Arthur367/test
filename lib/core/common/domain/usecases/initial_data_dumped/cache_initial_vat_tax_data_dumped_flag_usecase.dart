import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../repositories/repositories.dart';

@lazySingleton
class CacheInitialVatTaxDataDumpedFlagUseCase
    implements UseCase<void, FlagParams> {
  final VatTaxDataDumpedRepository _vatTaxDataDumpedRepository;

  const CacheInitialVatTaxDataDumpedFlagUseCase(
    this._vatTaxDataDumpedRepository,
  );

  @override
  Future<Either<Failure, void>> call(FlagParams params) async {
    return await _vatTaxDataDumpedRepository
        .cacheInitialVatTaxDumpedFlag(params.flag);
  }
}
