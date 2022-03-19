import 'package:equatable/equatable.dart';

class InvoiceEntity extends Equatable {
  final int id;
  final String invoicenumber;
  final double total;
  final double tax;
  final double subtotal;
  final String customerId;
  final int productId;
  final double price;
  final String invoiceId;
  final String productCode;
  final DateTime createdAt;

  const InvoiceEntity(
      {required this.id,
      required this.invoicenumber,
      required this.total,
      required this.tax,
      required this.subtotal,
      required this.customerId,
      required this.productId,
      required this.price,
      required this.invoiceId,
      required this.productCode,
      required this.createdAt});

  @override
  List<Object?> get props => [
        id,
        invoicenumber,
        total,
        tax,
        subtotal,
        customerId,
        productId,
        price,
        invoiceId,
        productCode,
        createdAt
      ];
}
