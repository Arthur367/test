// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) => InvoiceModel(
      id: json['id'] as int,
      invoicenumber: json['customer_invoice_no'] as String,
      total: InvoiceModel._stringToDouble(json['total_price'] as String),
      tax: InvoiceModel._stringToDouble(json['tax_amount'] as String),
      subtotal: InvoiceModel._stringToDouble(json['sub_total'] as String),
      customerId: json['customer_doc_number'] as String,
      productId: json['productId'] as int,
      price: InvoiceModel._stringToDouble(json['rate'] as String),
      invoiceId: json['invoiceId'] as String,
      productCode: json['product_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$InvoiceModelToJson(InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'invoiceId': instance.invoiceId,
      'customer_invoice_no': instance.invoicenumber,
      'product_id': instance.productCode,
      'tax_amount': InvoiceModel._stringFromDouble(instance.tax),
      'sub_total': InvoiceModel._stringFromDouble(instance.subtotal),
      'customer_doc_number': instance.customerId,
      'total_price': InvoiceModel._stringFromDouble(instance.total),
      'rate': InvoiceModel._stringFromDouble(instance.price),
      'created_at': instance.createdAt.toIso8601String(),
    };
