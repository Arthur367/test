import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/error/failures.dart';
import 'package:mobile_pos/core/usecases/usecase.dart' as usecase;
import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';
import 'package:mobile_pos/features/billing/domain/repositories/transaction_repository.dart';

@lazySingleton
class RetrieveTransactionsUseCase
    implements usecase.UseCase<List<TransactionEntity>, usecase.NoParams> {
  final TransactionRepository _transactionsRepository;
  const RetrieveTransactionsUseCase(this._transactionsRepository);

  @override
  Future<Either<Failure, List<TransactionEntity>>> call(
      usecase.NoParams params) async {
    // TODO: implement call
    return await _transactionsRepository.retrieveTransactions();
  }
}

@lazySingleton
class RetrieveTransactionUseCase implements usecase.UseCase<void, ItemParam> {
  final TransactionRepository _transactionRepository;
  const RetrieveTransactionUseCase(this._transactionRepository);

  @override
  Future<Either<Failure, void>> call(ItemParam params) async {
    // TODO: implement call
    return await _transactionRepository.retrieveTransaction(params.transaction);
  }
}

class ItemParam extends Equatable {
  final TransactionEntity transaction;

  const ItemParam({required this.transaction});

  @override
  List<Object?> get props => [transaction];
}
