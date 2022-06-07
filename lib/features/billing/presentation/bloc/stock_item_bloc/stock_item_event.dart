part of 'stock_item_bloc.dart';

abstract class StockItemEvent extends Equatable {
  const StockItemEvent();

  @override
  List<Object> get props => [];
}

class StockItemCheckBoxTappedEvent extends StockItemEvent {
  final int stockItemId;
  final bool selected;
  final double stockItemPrice;
  final double taxRate;
  final String stockItemCode;
  final double transactionQuantity;
  final String locationCode;
  final String storecode;
  final String customerId;

  const StockItemCheckBoxTappedEvent(
      {required this.stockItemId,
      required this.selected,
      required this.taxRate,
      required this.stockItemPrice,
      required this.stockItemCode,
      required this.transactionQuantity,
      required this.locationCode,
      required this.storecode,
      required this.customerId});

  @override
  List<Object> get props => [stockItemId, selected];

  @override
  String toString() =>
      'Stock item { item: $stockItemId } checkbox clicked. Item selected: $selected.';
}

class StockItemLoadedEvent extends StockItemEvent {
  final int stockItemId;

  const StockItemLoadedEvent({
    required this.stockItemId,
  });

  @override
  List<Object> get props => [stockItemId];

  @override
  String toString() => 'Stock item { item: $stockItemId } checkbox clicked.';
}

class UpdateStockItemEvent extends StockItemEvent {
  final List<StockModel> stock;
  const UpdateStockItemEvent({required this.stock});

  @override
  List<Object> get props => [stock];
}
