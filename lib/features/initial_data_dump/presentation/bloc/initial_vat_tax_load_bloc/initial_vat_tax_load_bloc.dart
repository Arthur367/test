import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/load_vat_tax_data_usecase.dart';

part 'initial_vat_tax_load_event.dart';
part 'initial_vat_tax_load_state.dart';

@injectable
class InitialVatTaxLoadBloc
    extends Bloc<InitialVatTaxLoadEvent, InitialVatTaxLoadState> {
  final LoadVatTaxDataUseCase _loadVatTaxDataUseCase;

  InitialVatTaxLoadBloc(this._loadVatTaxDataUseCase)
      : super(InitialVatTaxLoadInitial()) {
    on<VatTaxDownloadButtonPressed>(_onVatTaxDownloadButtonPressed);
  }

  void _onVatTaxDownloadButtonPressed(
    VatTaxDownloadButtonPressed event,
    Emitter<InitialVatTaxLoadState> emit,
  ) async {
    emit(InitialVatTaxLoadLoading());
    final result = await _loadVatTaxDataUseCase(NoParams());
    emit(
      result.fold(
        (l) => InitialVatTaxLoadError(error: l.toString()),
        (r) => const InitialVatTaxLoaded(message: 'Vat & Tax data saved.'),
      ),
    );
  }
}
