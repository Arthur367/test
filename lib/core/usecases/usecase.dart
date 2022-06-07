import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_pos/core/common/data/models/stock/stock_model.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/features/billing/data/models/invoice/invoice_model.dart';
import 'package:mobile_pos/features/billing/data/models/transactions/transactions_model.dart';

import '../error/failures.dart';

// base usecase from whcih all usecases will
// implement call method.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type?>> call(Params params);
}

// Pass this when the usecase expects no parameters
// e.g a call to get a list of products
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class FlagParams extends Equatable {
  final bool flag;

  const FlagParams({required this.flag});

  @override
  List<Object> get props => [flag];
}

class ItemParams extends Equatable {
  final StockModel item;

  const ItemParams({
    required this.item,
  });

  @override
  List<Object?> get props => [
        item,
      ];
}
