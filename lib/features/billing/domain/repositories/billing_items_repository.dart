import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../database/product_stock/product_with_stock.dart';
import '../entities/billing_item_entity.dart';

abstract class BillingItemsRepository {
  /// * Item refers to stock id and the quantity.
  /// * We do not want the local cache to hold all the product
  /// * details just one that can identify the particular product
  /// * and the quantity of the product.

  /// Add/update item
  Future<Either<Failure, void>> addOrUpdateItem(BillingItemEntity item);

  /// Retrieve stock item ids and their quantity
  Future<Either<Failure, List<BillingItemEntity>>> retrieveItems();

  /// remove item
  Future<Either<Failure, void>> removeItem(BillingItemEntity item);

  /// Remove all items
  Future<Either<Failure, void>> clearItems();

  /// Retrieve products-stock join.
  Future<Either<Failure, List<ProductWithStock>>> getBillingProducts();

  ///Checkout billing items
  Future<Either<Failure, void>> checkoutItems(items);
}
