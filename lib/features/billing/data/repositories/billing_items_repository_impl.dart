import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../database/product_stock/product_with_stock.dart';
import '../../domain/entities/billing_item_entity.dart';
import '../../domain/repositories/billing_items_repository.dart';
import '../datasources/local/billing_local/billing_items_local_data_source.dart';

@LazySingleton(as: BillingItemsRepository)
class BillingItemsRepositoryImpl implements BillingItemsRepository {
  final BillingItemsLocalDataSource _billingItemsLocalDataSource;

  const BillingItemsRepositoryImpl(this._billingItemsLocalDataSource);

  @override
  Future<Either<Failure, void>> addOrUpdateItem(BillingItemEntity item) async {
    try {
      return Right(await _billingItemsLocalDataSource.addOrUpdateItem(item));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> clearItems() async {
    try {
      return Right(await _billingItemsLocalDataSource.removeItems());
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductWithStock>>> getBillingProducts() async {
    try {
      return Right(await _billingItemsLocalDataSource.getBillingProductsList());
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeItem(BillingItemEntity item) async {
    try {
      return Right(await _billingItemsLocalDataSource.removeItem(item));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<BillingItemEntity>>> retrieveItems() async {
    try {
      return Right(await _billingItemsLocalDataSource.retrieveBillingItems());
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> checkoutItems(items) {
    // TODO: implement checkoutItems
    throw UnimplementedError();
  }
}
