import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/billing_item_entity.dart';
import '../repositories/billing_items_repository.dart';

@lazySingleton
class AddOrUpdateItemUseCase implements UseCase<void, ItemParams> {
  final BillingItemsRepository _billingItemsRepository;

  const AddOrUpdateItemUseCase(this._billingItemsRepository);

  @override
  Future<Either<Failure, void>> call(ItemParams params) async {
    return await _billingItemsRepository.addOrUpdateItem(params.item);
  }
}

class ItemParams extends Equatable {
  final BillingItemEntity item;

  const ItemParams({
    required this.item,
  });

  @override
  List<Object?> get props => [
        item,
      ];
}
