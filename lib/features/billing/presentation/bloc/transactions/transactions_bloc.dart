import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:mobile_pos/database/transaction/transactioned_items.dart';
import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';
import 'package:mobile_pos/features/billing/domain/usecases/usecases.dart';
import '../../../../../core/usecases/usecase.dart' as usecase;
part 'transactions_state.dart';
part 'transactions_event.dart';

@injectable
class TransactionsBloc extends Bloc<TransactionEvent, TransactionState> {
  final RetrieveTransactionsUseCase _retrieveTransactionsUseCase;
  final RetrieveTransactionUseCase _retrieveTransactionUseCase;
  final GetTransactionItemsUseCase _getTransactionItemsUseCase;
  TransactionsBloc(this._retrieveTransactionsUseCase,
      this._getTransactionItemsUseCase, this._retrieveTransactionUseCase)
      : super(TransactionLoading()) {
    on<RetrieveTransactionEvent>(_onRetrieveTransactionEvent);
    on<GetTransactionItemsEvent>(_onGetTransactionItemsEvent);
  }

  void _onGetTransactionItemsEvent(
    GetTransactionItemsEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());
    final result = await _getTransactionItemsUseCase(usecase.NoParams());
    final result2 = await _retrieveTransactionsUseCase(usecase.NoParams());
    emit(
      result.fold(
          (l) => const TransactionsError(error: 'Something went wrong'),
          (r) => result2.fold(
              (l) => const TransactionsError(error: 'Something Went wrong'),
              (r2) =>
                  TransactionsLoaded(transactions: r2, transactionItem: r))),
    );
  }

  void _onRetrieveTransactionEvent(
    RetrieveTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionsLoading());

    await _retrieveTransactionUseCase(ItemParam(transaction: event.transaction))
        .then((_) => add(RetrieveTransactionsEvent()));
  }
}
