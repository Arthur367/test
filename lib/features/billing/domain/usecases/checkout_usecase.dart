import 'package:mobile_pos/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/billing_items_repository.dart';

class CheckoutBillingItemsUsecase implements UseCase<void, ItemParams> {
  final BillingItemsRepository _billingItemsRepository;

  CheckoutBillingItemsUsecase(this._billingItemsRepository);

  @override
  Future<Either<Failure, void>> call(ItemParams params) {
    return _billingItemsRepository.checkoutItems(params.item);
  }
}
