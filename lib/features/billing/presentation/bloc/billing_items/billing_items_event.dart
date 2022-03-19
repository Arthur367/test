part of 'billing_items_bloc.dart';

abstract class BillingItemsEvent extends Equatable {
  const BillingItemsEvent();

  @override
  List<Object> get props => [];
}

class BillingItemLoadedEvent extends BillingItemsEvent {
  final int billingItemId;

  const BillingItemLoadedEvent({
    required this.billingItemId,
  });

  @override
  List<Object> get props => [billingItemId];

  @override
  String toString() => 'Billing item {item: $billingItemId} checkbox clicked.';
}

class GetBillingItemsEvent extends BillingItemsEvent {}

class GetBillingItemEvent extends BillingItemsEvent {
  final BillingItemEntity billingItem;

  const GetBillingItemEvent({required this.billingItem});
}

class UpdateBillingItemsEvent extends BillingItemsEvent {
  final BillingItemEntity billingItem;
  const UpdateBillingItemsEvent({required this.billingItem});
}

class UpdateBillingItemEvent extends BillingItemsEvent {
  final BillingItemEntity billingItem;
  const UpdateBillingItemEvent({required this.billingItem});
}

class RetrieveBillingItemsEvent extends BillingItemsEvent {}

class StockItemUpdatedEvent extends BillingItemsEvent {}

class RemoveBillingItemsEvent extends BillingItemsEvent {}

class ClearBillingItemEvent extends BillingItemsEvent {
  final BillingItemEntity billingItem;
  const ClearBillingItemEvent({required this.billingItem});
}

class CheckoutBillingItemsEvent extends BillingItemsEvent {
  final TransactionClass transaction;
  final List<InvoiceDataClass> invoices;
  const CheckoutBillingItemsEvent(
      {required this.transaction, required this.invoices});

  @override
  List<Object> get props => [transaction, invoices];
}

class BillingItemsSelectedEvent extends BillingItemsEvent {
  final bool selected;

  const BillingItemsSelectedEvent({required this.selected});

  @override
  List<Object> get props => [selected];

  @override
  String toString() => 'Billing Item selected: $selected.';
}
