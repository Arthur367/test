import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/common/data/models/customer/customer_model.dart';
import 'package:mobile_pos/features/initial_data_dump/data/responses/vat_tax_response.dart';

import '../../../../core/common/data/datasources/datasources.dart';
import '../../../../core/common/data/models/models.dart';
import '../../../../core/common/domain/entities/entities.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/initial_data_load_repository.dart';
import '../datasources/local/initial_data_dump_local_data_source.dart';
import '../datasources/remote/initial_data_load_remote_data_source.dart';

@LazySingleton(as: InitialDataLoadRepository)
class InitialDataLoadRepositoryImpl implements InitialDataLoadRepository {
  final InitialDataLoadRemoteDataSource _initialDataLoadRemoteDataSource;
  final InitialDataDumpLocalDataSource _initialDataDumpLocalDataSource;
  final InitialDataDumpCacheDataSource _initialDataDumpCacheDataSource;

  InitialDataLoadRepositoryImpl(
    this._initialDataLoadRemoteDataSource,
    this._initialDataDumpLocalDataSource,
    this._initialDataDumpCacheDataSource,
  );

  @override
  Future<Either<Failure, int>> loadLocationData() {
    // TODO: implement loadLocationData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> loadProductsData() async {
    try {
      final List<ProductModel> _products =
          await _initialDataLoadRemoteDataSource.getProducts();

      /// Populate local db with the products.
      _initialDataDumpLocalDataSource.insertMultipleProducts(_products);

      /// set product dumped true.
      _initialDataDumpCacheDataSource.setInitialProductsDumpedStatus(true);

      return Right(_products);
    } on ServerException catch (e) {
      /// An error occured of type server
      /// Probably some problem with the server.
      return Left(ServerFailure());
    } on DatabaseException catch (e) {
      /// some error occurred originating from the local
      /// database operations.
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<StockEntity>>> loadStockData() async {
    try {
      final List<StockModel> stocks =
          await _initialDataLoadRemoteDataSource.getStock();

      /// Populate local db with the data.
      _initialDataDumpLocalDataSource.insertMultipleStock(stocks);

      _initialDataDumpCacheDataSource.setInitialStockDumpedStatus(true);

      return Right(stocks);
    } on ServerException catch (e) {
      /// An error occured of type server
      /// Probably some problem with the server.
      return Left(ServerFailure());
    } on DatabaseException catch (e) {
      /// some error occurred originating from the local
      /// database operations.
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> loadStoreData() {
    // TODO: implement loadStoreData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> loadUserData() {
    // TODO: implement loadUserData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, VatTaxResponse>> loadVatTaxData() async {
    try {
      final VatTaxResponse response =
          await _initialDataLoadRemoteDataSource.getTaxVat();

      /// populate local db with vat data
      _initialDataDumpLocalDataSource.insertMultipleVat(response.vats);

      /// populate local db with tax data
      _initialDataDumpLocalDataSource.insertMultipleTax(response.taxes);

      /// Update vat tax status on cache
      _initialDataDumpCacheDataSource.setInitialVatTaxDumpedStatus(true);

      return Right(response);
    } on ServerException catch (e) {
      /// An error occured of type server
      /// Probably some problem with the server.
      return Left(ServerFailure());
    } on DatabaseException catch (e) {
      /// some error occurred originating from the local
      /// database operations.
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<CustomerEntity>>> loadCustomer() async {
    // TODO: implement loadCustomer
    try {
      final List<CustomerModel> customers =
          await _initialDataLoadRemoteDataSource.getCustomer();

      _initialDataDumpLocalDataSource.insertCustomer(customers);
      _initialDataDumpCacheDataSource.setInitialCustomerDumpedStatus(true);
      return Right(customers);
    } on ServerException catch (e) {
      return Left(ServerFailure());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
