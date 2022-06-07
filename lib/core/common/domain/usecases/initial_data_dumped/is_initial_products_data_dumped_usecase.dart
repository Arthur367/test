import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../repositories/initial_data_dump/products_data_dumped_repository.dart';

@lazySingleton
class IsInitialProductsDataDumpedUseCase implements UseCase<bool, NoParams> {
  final ProductsDataDumpedRepository _productsDataDumpedRepository;

  const IsInitialProductsDataDumpedUseCase(this._productsDataDumpedRepository);

  @override
  Future<Either<Failure, bool?>> call(NoParams params) async {
    return await _productsDataDumpedRepository.isInitialProductsDataDumped();
  }
}
