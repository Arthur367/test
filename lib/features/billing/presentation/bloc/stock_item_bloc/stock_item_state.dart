part of 'stock_item_bloc.dart';

abstract class StockItemState extends Equatable {
  const StockItemState();

  @override
  List<Object> get props => [];
}

class StockItemInitial extends StockItemState {}

class StockItemLoaded extends StockItemState {
  final bool selected;

  const StockItemLoaded({required this.selected});

  @override
  List<Object> get props => [selected];
}

class StockItemError extends StockItemState {}
