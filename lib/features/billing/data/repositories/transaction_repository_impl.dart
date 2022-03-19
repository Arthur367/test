import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/error/failures.dart';
import 'package:mobile_pos/database/transaction/transactioned_items.dart';
import 'package:mobile_pos/features/billing/data/datasources/local/transactions/transactions_local_data_source.dart';
import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';
import 'package:mobile_pos/features/billing/domain/repositories/transaction_repository.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRespositoryImpl implements TransactionRepository {
  final TransactionsLocalDataSource _transactionsLocalDataSource;

  const TransactionRespositoryImpl(this._transactionsLocalDataSource);

  @override
  Future<Either<Failure, void>> retrieveTransaction(
      TransactionEntity transaction) async {
    // TODO: implement retrieveTransaction
    try {
      return Right(
          await _transactionsLocalDataSource.retrieveTransaction(transaction));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>>
      retrieveTransactions() async {
    // TODO: implement retrieveTransactions
    try {
      return Right(await _transactionsLocalDataSource.retriveTransactions());
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<TransactionItems>>> getTransactionItems() async {
    try {
      return Right(
          await _transactionsLocalDataSource.getTransactionItemsList());
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
