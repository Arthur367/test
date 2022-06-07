part of 'transactions_model.dart';

TransactionsModel _$TransactionsModelFromJson(Map<String, dynamic> json) =>
    TransactionsModel(
      id: json['id'] as int,
      transactionId: json['transactionId'] as String,
      total: (json['total'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      customerId: json['customerId'] as String,
      customerName: json['customerName'] as String,
      customerEmail: json['customerEmail'] as String,
      customerPhone: json['customerPhone'] as int,
      invoiceId: json['invoiceId'] as String,
    );

Map<String, dynamic> _$TransactionsModelToJson(TransactionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionId': instance.transactionId,
      'total': instance.total,
      'tax': instance.tax,
      'subtotal': instance.subtotal,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'customerPhone': instance.customerPhone,
      'invoiceId': instance.invoiceId,
    };
