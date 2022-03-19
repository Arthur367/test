import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../repositories/repositories.dart';

@lazySingleton
class IsInitialVatTaxDataDumpedUseCase implements UseCase<bool, NoParams> {
  final VatTaxDataDumpedRepository _vatTaxDataDumpedRepository;

  const IsInitialVatTaxDataDumpedUseCase(this._vatTaxDataDumpedRepository);

  @override
  Future<Either<Failure, bool?>> call(NoParams params) async {
    return await _vatTaxDataDumpedRepository.isInitialVatTaxDumped();
  }
}
