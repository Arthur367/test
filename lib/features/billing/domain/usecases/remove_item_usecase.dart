import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/usecases/usecase.dart' as usecase;

import '../../../../core/error/failures.dart';
import '../repositories/billing_items_repository.dart';
import 'usecases.dart';

@lazySingleton
class RemoveItemUseCase implements usecase.UseCase<void, ItemParams> {
  final BillingItemsRepository _billingItemsRepository;

  const RemoveItemUseCase(this._billingItemsRepository);

  @override
  Future<Either<Failure, void>> call(ItemParams params) async {
    return await _billingItemsRepository.removeItem(params.item);
  }
}
