part of 'billing_items_bloc.dart';

abstract class BillingItemsState extends Equatable {
  const BillingItemsState();

  @override
  List<Object> get props => [];
}

class BillingItemsInitial extends BillingItemsState {}

class BillingItemsLoading extends BillingItemsState {}

class BillingItemLoading extends BillingItemsState {}

class BillingItemsLoaded extends BillingItemsState {
  final List<ProductWithStock> billingItems;
  final List<BillingItemEntity> billingItemsEntity;
  final bool selected;

  const BillingItemsLoaded({
    required this.billingItems,
    required this.billingItemsEntity,
    required this.selected,
  });

  @override
  List<Object> get props => [billingItems];

  @override
  String toString() => 'Billing items loaded { items: $billingItems }';
}

class BillingItemsError extends BillingItemsState {
  final String error;

  const BillingItemsError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Billing Items Error { error: $error }';
}

class BillingItemCleared extends BillingItemsState {}
