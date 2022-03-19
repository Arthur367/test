import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';

part 'billing_item_model.g.dart';

@JsonSerializable()
class BillingItemModel extends BillingItemEntity {
  const BillingItemModel({
    double? quantity,
    double? taxRate,
    double? stockItemPrice,
    required int stockItemId,
    double? availableQuantity,
    required String stockItemCode,
  }) : super(
            stockItemId: stockItemId,
            quantity: quantity ?? 0,
            unitPrice: stockItemPrice ?? 0,
            taxRate: taxRate ?? 0,
            availableQuantity: availableQuantity ?? 0,
            stockItemCode: stockItemCode,
            selected: false);

  factory BillingItemModel.fromJson(Map<String, dynamic> data) =>
      _$BillingItemModelFromJson(data);

  Map<String, dynamic> toJson() => _$BillingItemModelToJson(this);
}
