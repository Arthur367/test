import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';

part 'transactions_model.g.dart';

class TransactionsModel extends TransactionEntity {
  const TransactionsModel({
    required int id,
    required String transactionId,
    required double? total,
    required double? tax,
    required double? subtotal,
    required String customerId,
    required String? customerName,
    required String? customerEmail,
    required int? customerPhone,
    required String invoiceId,
  }) : super(
          id: id,
          transactionId: transactionId,
          total: total ?? 0,
          tax: tax ?? 0,
          subtotal: subtotal ?? 0,
          customerId: customerId,
          customerName: customerName ?? '',
          customerEmail: customerEmail ?? '',
          customerPhone: customerPhone ?? 123,
          invoiceId: invoiceId,
        );

  factory TransactionsModel.fromJson(Map<String, dynamic> data) =>
      _$TransactionsModelFromJson(data);

  Map<String, dynamic> toJson() => _$TransactionsModelToJson(this);
}
