part of 'initial_vat_tax_load_bloc.dart';

abstract class InitialVatTaxLoadState extends Equatable {
  const InitialVatTaxLoadState();

  @override
  List<Object> get props => [];
}

class InitialVatTaxLoadInitial extends InitialVatTaxLoadState {}

class InitialVatTaxLoadLoading extends InitialVatTaxLoadState {}

class InitialVatTaxLoaded extends InitialVatTaxLoadState {
  final String message;

  const InitialVatTaxLoaded({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'InitialVatTaxLoaded { message: $message }';
}

class InitialVatTaxLoadError extends InitialVatTaxLoadState {
  final String error;

  const InitialVatTaxLoadError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'InitialVatTax Loading error {error: $error}';
}
