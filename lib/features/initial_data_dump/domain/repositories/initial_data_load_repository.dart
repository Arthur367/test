import 'package:dartz/dartz.dart';
import 'package:mobile_pos/features/initial_data_dump/data/responses/vat_tax_response.dart';

import '../../../../core/common/domain/entities/entities.dart';
import '../../../../core/error/failures.dart';

/// Loads data from the API/Remote DB
/// for the first time app is started.
abstract class InitialDataLoadRepository {
  /// load user data.
  Future<Either<Failure, int>> loadUserData();

  /// load location information
  Future<Either<Failure, int>> loadLocationData();

  /// load store information
  Future<Either<Failure, int>> loadStoreData();

  /// load stock data
  Future<Either<Failure, List<StockEntity>>> loadStockData();

  /// load products data
  Future<Either<Failure, List<ProductEntity>>> loadProductsData();

  /// load
  Future<Either<Failure, VatTaxResponse>> loadVatTaxData();

  Future<Either<Failure, List<CustomerEntity>>> loadCustomer();
}
