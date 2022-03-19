import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/responses/vat_tax_response.dart';
import '../repositories/initial_data_load_repository.dart';

@lazySingleton
class LoadVatTaxDataUseCase implements UseCase<VatTaxResponse, NoParams> {
  final InitialDataLoadRepository _initialDataLoadRepository;

  const LoadVatTaxDataUseCase(this._initialDataLoadRepository);

  @override
  Future<Either<Failure, VatTaxResponse>> call(NoParams params) async {
    return await _initialDataLoadRepository.loadVatTaxData();
  }
}
