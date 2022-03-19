import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/di/injection.dart';
import 'package:mobile_pos/features/billing/data/datasources/local/billing_local/billing_items_local_data_source.dart';
import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';

import '../../../../../core/usecases/usecase.dart' as usecase;
import '../../../../../database/product_stock/product_with_stock.dart';
import '../../../domain/usecases/usecases.dart';

part 'billing_items_event.dart';
part 'billing_items_state.dart';

@injectable
class BillingItemsBloc extends Bloc<BillingItemsEvent, BillingItemsState> {
  final GetBillingProductsUseCase _getBillingProductsUseCase;
  final AddOrUpdateItemUseCase _addOrUpdateItemUseCase;
  final RetriveItemsUseCase _retriveItemsUseCase;
  final ClearItemsUseCase _clearItemsUseCase;
  final RemoveItemUseCase _removeItemUseCase;

  BillingItemsBloc(
      this._clearItemsUseCase,
      this._getBillingProductsUseCase,
      this._addOrUpdateItemUseCase,
      this._retriveItemsUseCase,
      this._removeItemUseCase)
      : super(BillingItemsLoading()) {
    on<GetBillingItemsEvent>(_onGetBillingItemsEvent);
    on<UpdateBillingItemsEvent>(_onUpdateBillingItemsEvent);
    on<RemoveBillingItemsEvent>(_onRemoveBillingItemsEvent);
    on<CheckoutBillingItemsEvent>(_onCheckoutBillingItemsEvent);
    on<ClearBillingItemEvent>(_onClearBillingItemEvent);
    on<UpdateBillingItemEvent>(_onUpdateBillingItem);
  }

  void _onGetBillingItemsEvent(
    GetBillingItemsEvent event,
    Emitter<BillingItemsState> emit,
  ) async {
    emit(BillingItemsLoading());
    final result = await _getBillingProductsUseCase(usecase.NoParams());
    final result2 = await _retriveItemsUseCase(usecase.NoParams());
    emit(
      result.fold(
          (l) => const BillingItemsError(error: 'Something went wrong.'),
          (r) => result2.fold(
                (l2) => const BillingItemsError(error: 'Something went wrong.'),
                (r2) => BillingItemsLoaded(
                    billingItems: r, billingItemsEntity: r2, selected: false),
              )),
    );
  }

  void _onUpdateBillingItemsEvent(
    UpdateBillingItemsEvent event,
    Emitter<BillingItemsState> emit,
  ) async {
    emit(BillingItemsLoading());

    await _addOrUpdateItemUseCase(ItemParams(item: event.billingItem))
        .then((_) => add(GetBillingItemsEvent()));
  }

  void _onUpdateBillingItem(
    UpdateBillingItemEvent event,
    Emitter<BillingItemsState> emit,
  ) async {
    emit(BillingItemLoading());

    await _addOrUpdateItemUseCase(ItemParams(item: event.billingItem))
        .then((_) => add(GetBillingItemsEvent()));
  }

// TODO: Implement remove billed items
  void _onRemoveBillingItemsEvent(
      RemoveBillingItemsEvent event, Emitter<BillingItemsState> emit) async {
    emit(BillingItemsLoading());

    _clearItemsUseCase(usecase.NoParams());

    emit(const BillingItemsLoaded(
        billingItems: [], billingItemsEntity: [], selected: false));
  }

  void _onCheckoutBillingItemsEvent(
    CheckoutBillingItemsEvent event,
    Emitter<BillingItemsState> emit,
  ) async {
    emit(BillingItemsLoading());
    final result = await getIt<BillingItemsLocalDataSource>()
        .checkoutBillingItems(
            TransactionTableCompanion(
              invoiceId: Value(event.transaction.invoiceId),
              tax: Value(event.transaction.tax),
              total: Value(event.transaction.total),
              subtotal: Value(event.transaction.subtotal),
              customerId: Value(event.transaction.customerId),
              customerName: Value(event.transaction.customerName),
              customerEmail: Value(event.transaction.customerEmail),
              customerPhone: Value(event.transaction.customerPhone),
              transactionId: Value(event.transaction.transactionId),
              paymentMethod: Value(event.transaction.paymentMethod),
            ),
            event.invoices
                .map((e) => InvoiceTableCompanion(
                    invoiceId: Value(e.invoiceId),
                    productId: Value(e.productId),
                    quantity: Value(e.quantity),
                    price: Value(e.price),
                    invoicenumber: Value(e.invoicenumber),
                    customerId: Value(e.customerId),
                    total: Value(e.total),
                    subtotal: Value(e.subtotal),
                    tax: Value(e.tax),
                    productCode: Value(e.productCode),
                    createdAt: Value(e.createdAt)))
                .toList())
        .then((_) async => await getIt<BillingItemsLocalDataSource>()
            .getBillingProductsList());
    emit(const BillingItemsLoaded(
        billingItems: [], billingItemsEntity: [], selected: false));
  }

  void _onClearBillingItemEvent(
    ClearBillingItemEvent event,
    Emitter<BillingItemsState> emit,
  ) async {
    emit(BillingItemsLoading());

    await _removeItemUseCase(ItemParams(item: event.billingItem))
        .then((_) => add(GetBillingItemsEvent()));
  }
}
