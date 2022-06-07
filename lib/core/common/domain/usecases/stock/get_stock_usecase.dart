import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';

@lazySingleton
class GetStockUseCase implements UseCase<List<StockEntity>, NoParams> {
  final StockRepository _stockRepository;

  const GetStockUseCase(this._stockRepository);

  @override
  Future<Either<Failure, List<StockEntity>>> call(NoParams params) async {
    return await _stockRepository.getStock();
  }
}
