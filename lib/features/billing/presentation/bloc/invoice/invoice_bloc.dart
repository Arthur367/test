import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/features/billing/domain/entities/invoice_entity.dart';
import 'package:mobile_pos/features/billing/domain/usecases/retrieve_items_usecase.dart';
import '../../../../../core/usecases/usecase.dart' as usecase;
part 'invoice_event.dart';
part 'invoice_state.dart';

@injectable
class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  final RetrieveInvoicesUseCase _retrieveInvoicesUseCase;
  final RetrieveInvoiceUseCase _retrieveInvoiceUseCase;
  InvoiceBloc(
    this._retrieveInvoiceUseCase,
    this._retrieveInvoicesUseCase,
  ) : super(InvoiceLoading()) {
    on<RetrieveInvoiceEvent>(_onRetrieveInvoiceEvent);
    on<RetriveInvoicesEvent>(_onRetrieveInvoicesEvent);
  }

  void _onRetrieveInvoicesEvent(
    RetriveInvoicesEvent event,
    Emitter<InvoiceState> emit,
  ) async {
    emit(InvoiceLoading());
    final result = await _retrieveInvoicesUseCase(usecase.NoParams());
    emit(result.fold(
      (l) => const InvoicesError(error: 'Something went wrong'),
      (r) => InvoicesLoaded(invoices: r),
    ));
  }

  void _onRetrieveInvoiceEvent(
    RetrieveInvoiceEvent event,
    Emitter<InvoiceState> emit,
  ) async {
    emit(InvoiceLoading());

    await _retrieveInvoiceUseCase(ItemParame(invoice: event.invoice))
        .then((_) => add(RetriveInvoicesEvent()));
  }
}
