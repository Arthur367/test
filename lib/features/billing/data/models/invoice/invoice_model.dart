import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_pos/database/product/product_dao.dart';
import 'package:mobile_pos/features/billing/domain/entities/invoice_entity.dart';
part 'invoice_model.g.dart';

@JsonSerializable()
class InvoiceModel extends InvoiceEntity {
  const InvoiceModel({
    required int id,
    required String invoicenumber,
    required double? total,
    required double? tax,
    required double? subtotal,
    required String customerId,
    required int productId,
    required double? price,
    required String invoiceId,
    required String productCode,
    required DateTime createdAt,
  }) : super(
          id: id,
          invoicenumber: invoicenumber,
          total: total ?? 0,
          tax: tax ?? 0,
          subtotal: subtotal ?? 0,
          customerId: customerId,
          productId: productId,
          price: price ?? 0,
          invoiceId: invoiceId,
          productCode: productCode,
          createdAt: createdAt,
        );
  factory InvoiceModel.fromJson(Map<String, dynamic> data) =>
      _$InvoiceModelFromJson(data);

  Map<String, dynamic> toJson() => _$InvoiceModelToJson(this);
}
