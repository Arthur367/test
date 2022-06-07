import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/common/domain/entities/entities.dart';
import 'package:mobile_pos/core/error/failures.dart';
import 'package:mobile_pos/core/usecases/usecase.dart';
import 'package:mobile_pos/features/initial_data_dump/domain/repositories/initial_data_load_repository.dart';

@lazySingleton
class LoadCustomerUseCase implements UseCase<List<CustomerEntity>, NoParams> {
  final InitialDataLoadRepository _initialDataLoadRepository;
  const LoadCustomerUseCase(this._initialDataLoadRepository);

  @override
  Future<Either<Failure, List<CustomerEntity>?>> call(NoParams params) async {
    // TODO: implement call
    return await _initialDataLoadRepository.loadCustomer();
  }
}
