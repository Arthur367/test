import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_pos/database/product/product_dao.dart';
import 'package:mobile_pos/features/billing/domain/entities/invoice_entity.dart';
part 'invoice_model.g.dart';

@JsonSerializable()
class InvoiceModel extends InvoiceEntity {
  @JsonKey(name: 'customer_invoice_no')
  final String invoicenumber;

  @JsonKey(name: 'product_id')
  final String productCode;

  @JsonKey(
    name: 'tax_amount',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double tax;

  @JsonKey(
    name: 'sub_total',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double subtotal;

  @JsonKey(name: 'customer_doc_number')
  final String customerId;

  @JsonKey(
    name: 'total_price',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double total;

  @JsonKey(
    name: 'rate',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double price;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const InvoiceModel({
    required int id,
    required this.invoicenumber,
    required this.total,
    required this.tax,
    required this.subtotal,
    required this.customerId,
    required int productId,
    required this.price,
    required String invoiceId,
    required this.productCode,
    required this.createdAt,
  }) : super(
          id: id,
          invoicenumber: invoicenumber,
          total: total,
          tax: tax,
          subtotal: subtotal,
          customerId: customerId,
          productId: productId,
          price: price,
          invoiceId: invoiceId,
          productCode: productCode,
          createdAt: createdAt,
        );
  factory InvoiceModel.fromJson(Map<String, dynamic> data) =>
      _$InvoiceModelFromJson(data);

  Map<String, dynamic> toJson() => _$InvoiceModelToJson(this);

  static int _stringToInt(String number) => int.parse(number);
  static String _stringFromInt(int number) => number.toString();

  static double _stringToDouble(String number) => double.parse(number);
  static String _stringFromDouble(double number) => number.toString();
}
