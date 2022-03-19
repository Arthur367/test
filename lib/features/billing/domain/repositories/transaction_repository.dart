import 'package:dartz/dartz.dart';
import 'package:mobile_pos/core/error/failures.dart';
import 'package:mobile_pos/database/transaction/transactioned_items.dart';
import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionEntity>>> retrieveTransactions();
  Future<Either<Failure, void>> retrieveTransaction(
      TransactionEntity transaction);
  Future<Either<Failure, List<TransactionItems>>> getTransactionItems();
}
