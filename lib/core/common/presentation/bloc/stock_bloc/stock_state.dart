part of 'stock_bloc.dart';

abstract class StockState extends Equatable {
  const StockState();

  @override
  List<Object> get props => [];
}

class StockInitial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<StockEntity> stock;

  const StockLoaded({required this.stock});

  @override
  List<Object> get props => [stock];

  @override
  String toString() => 'StockLoaded { stocks: $stock }';
}

class StockError extends StockState {
  final String error;

  const StockError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'StockError { error: $error }';
}
