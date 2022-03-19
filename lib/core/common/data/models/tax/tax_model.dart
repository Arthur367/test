import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'tax_model.g.dart';

@JsonSerializable()
class TaxModel extends TaxEntity {
  @JsonKey(name: 'auto_number')
  final int autoNumber_;
  @JsonKey(name: 'tax_id')
  final String taxId_;
  @JsonKey(name: 'tax_name')
  final String taxName_;
  @JsonKey(name: 'tax_percent')
  final double taxPercent_;
  @JsonKey(name: 'exclude_goods')
  final bool excludeGoods_;

  const TaxModel({
    int? id,
    required this.autoNumber_,
    required this.taxId_,
    required this.taxName_,
    required this.taxPercent_,
    required this.excludeGoods_,
  }) : super(
          id: id,
          autoNumber: autoNumber_,
          taxId: taxId_,
          excludeGoods: excludeGoods_,
          taxName: taxName_,
          taxPercent: taxPercent_,
        );

  factory TaxModel.fromJson(Map<String, dynamic> data) =>
      _$TaxModelFromJson(data);

  Map<String, dynamic> toJson() => _$TaxModelToJson(this);
}
