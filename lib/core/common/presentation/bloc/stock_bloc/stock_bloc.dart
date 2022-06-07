import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/domain/entities/entities.dart';
import '../../../../../core/common/domain/usecases/usecases.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../data/models/stock/stock_model.dart';

part 'stock_event.dart';
part 'stock_state.dart';

@injectable
class StockBloc extends Bloc<StockEvent, StockState> {
  final GetStockUseCase _getStockUseCase;
  StockBloc(this._getStockUseCase) : super(StockInitial()) {
    on<GetStockAtHandEvent>(_onGetStockAtHandEvent);
  }

  void _onGetStockAtHandEvent(
    GetStockAtHandEvent event,
    Emitter<StockState> emit,
  ) async { 
    emit(StockLoading());
    final result = await _getStockUseCase(NoParams());
    emit(
      result.fold(
        (l) => const StockError(error: 'Some error occurred'),
        (r) => StockLoaded(stock: r),
      ),
    );
  }
}
