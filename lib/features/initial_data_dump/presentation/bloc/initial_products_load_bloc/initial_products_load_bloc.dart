import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/load_products_usecase.dart';

part 'initial_products_load_event.dart';
part 'initial_products_load_state.dart';

@injectable
class InitialProductsLoadBloc
    extends Bloc<InitialProductsLoadEvent, InitialProductsLoadState> {
  final LoadProductsUseCase _loadProductsUseCase;

  InitialProductsLoadBloc(this._loadProductsUseCase)
      : super(InitialProductsLoadInitial()) {
    on<ProductsDownloadButtonPressed>(_onProductsDownloadButtonPressed);
  }

  void _onProductsDownloadButtonPressed(
    ProductsDownloadButtonPressed event,
    Emitter<InitialProductsLoadState> emit,
  ) async {
    emit(InitialProductsLoadLoading());
    final result = await _loadProductsUseCase.call(NoParams());
    emit(
      result.fold(
        (l) => InitialProductsLoadError(error: l.toString()),
        (r) => const InitialProductsLoaded(message: 'Products saved.'),
      ),
    );
  }
}
