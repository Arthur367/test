part of 'transactions_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionsLoadedEvent extends TransactionEvent {
  final int transationId;

  const TransactionsLoadedEvent({required this.transationId});
  @override
  List<Object> get props => [transationId];

  @override
  String toString() => 'Transaction {transactions: ${transationId}} loaded';
}

class RetrieveTransactionsEvent extends TransactionEvent {}

class RetrieveTransactionEvent extends TransactionEvent {
  final TransactionEntity transaction;
  const RetrieveTransactionEvent({required this.transaction});
}

class GetTransactionItemsEvent extends TransactionEvent {}
