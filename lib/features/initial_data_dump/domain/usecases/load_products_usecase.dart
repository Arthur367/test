import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/domain/entities/entities.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/initial_data_load_repository.dart';

@lazySingleton
class LoadProductsUseCase implements UseCase<List<ProductEntity>, NoParams> {
  final InitialDataLoadRepository _initialDataLoadRepository;

  const LoadProductsUseCase(this._initialDataLoadRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await _initialDataLoadRepository.loadProductsData();
  }
}
