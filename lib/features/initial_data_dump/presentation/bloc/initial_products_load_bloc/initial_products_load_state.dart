part of 'initial_products_load_bloc.dart';

abstract class InitialProductsLoadState extends Equatable {
  const InitialProductsLoadState();

  @override
  List<Object> get props => [];
}

class InitialProductsLoadInitial extends InitialProductsLoadState {}

class InitialProductsLoadLoading extends InitialProductsLoadState {}

class InitialProductsLoaded extends InitialProductsLoadState {
  final String message;

  const InitialProductsLoaded({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'InitialProductsLoaded {message: $message}';
}

class InitialProductsLoadError extends InitialProductsLoadState {
  final String error;

  const InitialProductsLoadError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'InitialStock Loading error {error: $error}';
}
