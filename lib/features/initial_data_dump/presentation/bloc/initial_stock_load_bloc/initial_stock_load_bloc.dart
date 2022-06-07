import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/load_stock_data_usecase.dart';

part 'initial_stock_load_event.dart';
part 'initial_stock_load_state.dart';

@injectable
class InitialStockLoadBloc
    extends Bloc<InitialStockLoadEvent, InitialStockLoadState> {
  final LoadStockDataUseCase _loadStockDataUseCase;

  InitialStockLoadBloc(this._loadStockDataUseCase)
      : super(InitialStockLoadInitial()) {
    on<StockDownloadButtonPressed>(_onStockDownloadButtonPressed);
  }

  void _onStockDownloadButtonPressed(
    StockDownloadButtonPressed event,
    Emitter<InitialStockLoadState> emit,
  ) async {
    emit(InitialStockLoadLoading());
    final result = await _loadStockDataUseCase(NoParams());
    emit(
      result.fold(
        (l) => InitialStockLoadError(error: l.toString()),
        (r) => const InitialStockLoadLoaded(message: 'Stock Loading complete'),
      ),
    );
  }
}
