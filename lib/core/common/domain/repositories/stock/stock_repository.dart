import 'package:dartz/dartz.dart';
import 'package:mobile_pos/core/common/data/datasources/datasources.dart';
import 'package:mobile_pos/core/common/data/models/stock/stock_model.dart';

import '../../entities/entities.dart';
import '../../../../error/failures.dart';

abstract class StockRepository {
  /// Get stock.
  Future<Either<Failure, List<StockModel>>> getStock();

  //Update stock.
  Future<Either<Failure, void>> updateStock(StockModel stock);
}

class StockRepositoryImpl implements StockRepository {
  final StockLocalDataSource stockLocalDataSource;

  StockRepositoryImpl(this.stockLocalDataSource);
  @override
  Future<Either<Failure, List<StockModel>>> getStock() async {
    try {
      final result = await stockLocalDataSource.retrieveStock();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateStock(StockModel stock) async {
    try {
      print("From Repository: $stock");
      await stockLocalDataSource.updateStock(stock);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
