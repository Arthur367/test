import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/billing_items_repository.dart';

@lazySingleton
class ClearItemsUseCase implements UseCase<void, NoParams> {
  final BillingItemsRepository _billingItemsRepository;

  const ClearItemsUseCase(this._billingItemsRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _billingItemsRepository.clearItems();
  }
}
