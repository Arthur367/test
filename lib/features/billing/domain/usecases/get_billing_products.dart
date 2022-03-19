import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/product_stock/product_with_stock.dart';
import 'package:mobile_pos/database/transaction/transactioned_items.dart';
import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';
import 'package:mobile_pos/features/billing/domain/repositories/transaction_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/billing_items_repository.dart';

@lazySingleton
class GetBillingProductsUseCase
    implements UseCase<List<ProductWithStock>, NoParams> {
  final BillingItemsRepository _billingItemsRepository;

  const GetBillingProductsUseCase(this._billingItemsRepository);

  @override
  Future<Either<Failure, List<ProductWithStock>>> call(NoParams params) {
    return _billingItemsRepository.getBillingProducts();
  }

  Future<Either<Failure, void>> addOrUpdate(BillingItemEntity item) {
    return _billingItemsRepository.addOrUpdateItem(item);
  }
}

@lazySingleton
class GetTransactionItemsUseCase
    implements UseCase<List<TransactionItems>, NoParams> {
  final TransactionRepository _transactionRepository;
  const GetTransactionItemsUseCase(this._transactionRepository);

  @override
  Future<Either<Failure, List<TransactionItems>>> call(NoParams params) {
    return _transactionRepository.getTransactionItems();
  }
}
