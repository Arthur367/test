import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/app_database.dart';

import '../../../../error/failures.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/repositories/repositories.dart';
import '../../datasources/datasources.dart';
import '../../models/models.dart';

@LazySingleton(as: StockRepository)
class StockRepositoryImpl implements StockRepository {
  final StockLocalDataSource _stockLocalDataSource;

  const StockRepositoryImpl(this._stockLocalDataSource);

  @override
  Future<Either<Failure, List<StockModel>>> getStock() async {
    try {
      final List<StockModel> _stock =
          await _stockLocalDataSource.retrieveStock();
      return Right(_stock);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateStock(StockModel stock) async {
    try {
      await _stockLocalDataSource.updateStock(stock);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
