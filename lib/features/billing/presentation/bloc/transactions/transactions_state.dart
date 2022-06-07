part of 'transactions_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
  @override
  List<Object> get props => [];
}

class TransactionsIntial extends TransactionState {}

class TransactionsLoading extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionDetailsloaded extends TransactionEvent {
  final int id;

  const TransactionDetailsloaded({required this.id});

  @override
  List<Object> get props => [id];
}

class TransactionsLoaded extends TransactionState {
  final List<TransactionItems> transactionItem;
  final List<TransactionEntity> transactions;

  const TransactionsLoaded(
      {required this.transactions, required this.transactionItem});

  @override
  List<Object> get props => [transactions, transactionItem];

  @override
  String toString() => 'Transactions loaded { transactions: $transactions}';
}

class TransactionsError extends TransactionState {
  final String error;

  const TransactionsError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Billing Items Error { error: $error }';
}
