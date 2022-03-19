import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/domain/entities/entities.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/initial_data_load_repository.dart';

@lazySingleton
class LoadStockDataUseCase implements UseCase<List<StockEntity>, NoParams> {
  final InitialDataLoadRepository _initialDataLoadRepository;

  const LoadStockDataUseCase(this._initialDataLoadRepository);

  @override
  Future<Either<Failure, List<StockEntity>>> call(NoParams params) async {
    return await _initialDataLoadRepository.loadStockData();
  }
}
