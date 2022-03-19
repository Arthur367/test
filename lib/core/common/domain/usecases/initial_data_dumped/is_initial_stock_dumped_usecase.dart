import 'package:injectable/injectable.dart';
import '../../repositories/repositories.dart';
import '../../../../error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../usecases/usecase.dart';

@lazySingleton
class IsInitialStockDumpedUseCase implements UseCase<bool, NoParams> {
  final StockDataDumpedRepository _stockDataDumpedRepository;

  const IsInitialStockDumpedUseCase(this._stockDataDumpedRepository);

  @override
  Future<Either<Failure, bool?>> call(NoParams params) async {
    return await _stockDataDumpedRepository.isInitialStockDumped();
  }
}
