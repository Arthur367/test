import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/common/domain/usecases/stock/update_stock_usecase.dart';
import 'package:mobile_pos/features/billing/presentation/bloc/billing_items/billing_items_bloc.dart';

import '../../../../../core/common/data/models/models.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/billing_item_entity.dart';
import '../../../domain/usecases/usecases.dart' as billing;

part 'stock_item_event.dart';
part 'stock_item_state.dart';

@injectable
class StockItemBloc extends Bloc<StockItemEvent, StockItemState> {
  final billing.AddOrUpdateItemUseCase _addOrUpdateItemUseCase;
  final billing.RemoveItemUseCase _removeItemUseCase;
  final UpdateStockUseCase _updateStockUseCase;
  StockItemBloc(
    this._addOrUpdateItemUseCase,
    this._updateStockUseCase,
    this._removeItemUseCase,
  ) : super(StockItemInitial()) {
    on<StockItemCheckBoxTappedEvent>(_onStockItemCheckBoxTappedEvent);
    on<StockItemLoadedEvent>(_onStockItemLoadedEvent);
    on<UpdateStockItemEvent>(_onUpdateStockItemEvent);
  }

  void _onStockItemLoadedEvent(
    StockItemLoadedEvent event,
    Emitter<StockItemState> emit,
  ) {
    event.stockItemId;
    emit(const StockItemLoaded(selected: false));
  }

  void _onUpdateStockItemEvent(
    UpdateStockItemEvent event,
    Emitter<StockItemState> emit,
  ) async {
    int index = 0;
    for (var element in event.stock) {
      index += 1;
      final result = await _updateStockUseCase.call(ItemParams(item: element));
      if (index == event.stock.length) {
        result.fold((l) => emit(StockItemError()),
            (r) => emit(const StockItemLoaded(selected: false)));
      }
    }
  }

  void _onStockItemCheckBoxTappedEvent(
    StockItemCheckBoxTappedEvent event,
    Emitter<StockItemState> emit,
  ) async {
    if (event.selected) {
      // item is selected already.
      // implies item in billing list. therefore, remove it from billing items.
      final result = await _removeItemUseCase.call(
        billing.ItemParams(
          item: BillingItemEntity(
              stockItemId: event.stockItemId,
              unitPrice: event.stockItemPrice,
              taxRate: event.taxRate,
              quantity: 1,
              stockItemCode: event.stockItemCode,
              transactionQuantity: event.transactionQuantity,
              selected: true,
              locationCode: event.locationCode,
              storecode: event.locationCode,
              customerId: event.customerId),
        ),
      );
      emit(
        result.fold(
          (l) => StockItemError(),
          (r) => const StockItemLoaded(selected: false),
        ),
      );
    } else {
      // else add item to list.
      final result = await _addOrUpdateItemUseCase.call(
        billing.ItemParams(
          item: BillingItemEntity(
              stockItemId: event.stockItemId,
              unitPrice: event.stockItemPrice,
              taxRate: event.taxRate,
              quantity: 1,
              stockItemCode: event.stockItemCode,
              transactionQuantity: event.transactionQuantity,
              selected: false,
              locationCode: event.locationCode,
              storecode: event.storecode,
              customerId: event.customerId),
        ),
      );
      emit(
        result.fold(
          (l) => StockItemError(),
          (r) => const StockItemLoaded(selected: true),
        ),
      );
    }
  }
}
