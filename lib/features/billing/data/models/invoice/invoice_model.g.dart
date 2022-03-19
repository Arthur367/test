part of 'invoice_model.dart';

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) => InvoiceModel(
    id: json['id'] as int,
    invoicenumber: json['invoicenumber'] as String,
    total: (json['total'] as num?)?.toDouble(),
    tax: (json['tax'] as num?)?.toDouble(),
    subtotal: (json['subtotal'] as num?)?.toDouble(),
    customerId: json['customerId'] as String,
    productId: json['productId'] as int,
    price: (json['price'] as num?)?.toDouble(),
    invoiceId: json['invoiceId'] as String,
    productCode: json['productCode'] as String,
    createdAt: json['createdAt'] as DateTime);

Map<String, dynamic> _$InvoiceModelToJson(InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoicenumber': instance.invoicenumber,
      'total': instance.total,
      'tax': instance.tax,
      'subtotal': instance.subtotal,
      'customerId': instance.subtotal,
      'productId': instance.productId,
      'price': instance.price,
      'invoiceId': instance.invoiceId,
      'productCode': instance.productCode,
      'createdAt': instance.createdAt,
    };
