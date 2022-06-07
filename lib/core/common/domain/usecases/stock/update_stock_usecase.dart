import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/app_database.dart';

import '../../../../error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../repositories/repositories.dart';

@lazySingleton
class UpdateStockUseCase implements UseCase<void, ItemParams> {
  final StockRepository _stockRepository;

  const UpdateStockUseCase(this._stockRepository);

  @override
  Future<Either<Failure, void>> call(ItemParams params) async {
    print("And also here");
    print(params.item);
    return await _stockRepository.updateStock(params.item);
  }
}
