part of 'invoice_bloc.dart';

abstract class InvoiceEvent extends Equatable {
  const InvoiceEvent();

  @override
  List<Object> get props => [];
}

class InvoiceLoadedEvent extends InvoiceEvent {
  final int invoiceId;

  const InvoiceLoadedEvent({required this.invoiceId});
  @override
  List<Object> get props => [invoiceId];

  @override
  String toString() => 'Invoice {Invoice: ${invoiceId}} loaded';
}

class RetriveInvoicesEvent extends InvoiceEvent {}

class RetrieveInvoiceEvent extends InvoiceEvent {
  final InvoiceEntity invoice;
  const RetrieveInvoiceEvent({required this.invoice});
}
