import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final int id;
  final String transactionId;
  final double total;
  final double tax;
  final double subtotal;
  final String customerId;
  final String customerName;
  final int customerPhone;
  final String customerEmail;
  final String invoiceId;
  

  const TransactionEntity({
    required this.id,
    required this.transactionId,
    required this.total,
    required this.tax,
    required this.subtotal,
    required this.customerId,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.invoiceId,
    
  });

  @override
  List<Object?> get props => [
        id,
        transactionId,
        total,
        tax,
        subtotal,
        customerId,
        customerName,
        customerEmail,
        customerPhone,
        invoiceId
      ];
}
