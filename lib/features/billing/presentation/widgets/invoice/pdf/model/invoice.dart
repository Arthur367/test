import 'package:mobile_pos/features/billing/presentation/widgets/invoice/pdf/model/customer.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/pdf/model/supplier.dart';

class Invoice {
  final InvoiceInfo info;
  final Payment payment;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItem> items;
  final InvoiceTotal total;

  const Invoice(
      {required this.info,
      required this.customer,
      required this.items,
      required this.total,
      required this.supplier,
      required this.payment});
}

class InvoiceInfo {
  final String number;
  final DateTime date;

  const InvoiceInfo({
    required this.number,
    required this.date,
  });
}

class InvoiceTotal {
  final double subTotal;
  final double tax;
  final double total;

  InvoiceTotal(
      {required this.subTotal, required this.tax, required this.total});
}

class InvoiceItem {
  final String name;
  final DateTime date;
  final int quantity;
  final double vat;
  final double unitPrice;
  final double total;

  const InvoiceItem(
      {required this.name,
      required this.date,
      required this.quantity,
      required this.vat,
      required this.unitPrice,
      required this.total});
}

class Payment {
  final String name;

  Payment({required this.name});
}
