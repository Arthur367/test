part of 'initial_load_customer_bloc.dart';

abstract class InitialCustomerLoadState extends Equatable {
  const InitialCustomerLoadState();

  @override
  List<Object> get props => [];
}

class InitialCustomerLoadInitial extends InitialCustomerLoadState {}

class InitialCustomerLoadLoading extends InitialCustomerLoadState {}

class InitialCustomerLoaded extends InitialCustomerLoadState {
  final String message;

  const InitialCustomerLoaded({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'InitialCustomerLoaded {message: $message}';
}

class InitialCustomerLoadError extends InitialCustomerLoadState {
  final String error;

  const InitialCustomerLoadError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'InitialStock Loading error {error: $error}';
}
