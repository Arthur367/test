part of 'invoice_bloc.dart';

abstract class InvoiceState extends Equatable {
  const InvoiceState();

  @override
  List<Object> get props => [];
}

class InvoicesIntial extends InvoiceState {}

class InvoicesLoading extends InvoiceState {}

class InvoiceLoading extends InvoiceState {}

class InvoicesLoaded extends InvoiceState {
  final List<InvoiceEntity> invoices;

  const InvoicesLoaded({required this.invoices});

  @override
  List<Object> get props => [invoices];

  @override
  String toString() => 'Invoices loaded { Invoices: $invoices}';
}

class InvoicesError extends InvoiceState {
  final String error;

  const InvoicesError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Billing Items Error { error: $error }';
}
