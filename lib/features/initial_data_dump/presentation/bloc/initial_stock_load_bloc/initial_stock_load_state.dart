part of 'initial_stock_load_bloc.dart';

abstract class InitialStockLoadState extends Equatable {
  const InitialStockLoadState();

  @override
  List<Object> get props => [];
}

class InitialStockLoadInitial extends InitialStockLoadState {}

class InitialStockLoadLoading extends InitialStockLoadState {}

class InitialStockLoadLoaded extends InitialStockLoadState {
  final String message;

  const InitialStockLoadLoaded({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'InitialStockLoaded { message: $message }';
}

class InitialStockLoadError extends InitialStockLoadState {
  final String error;

  const InitialStockLoadError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'InitialStock Loading error {error: $error}';
}
