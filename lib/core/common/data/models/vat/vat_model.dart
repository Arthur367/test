import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'vat_model.g.dart';

@JsonSerializable()
class VatModel extends VatEntity {
  @JsonKey(name: 'auto_number')
  final int autoNumber_;
  @JsonKey(name: 'vat_id')
  final String vatId_;
  @JsonKey(name: 'vat')
  final String vatName_;

  const VatModel({
    int? id,
    required this.autoNumber_,
    required this.vatId_,
    required this.vatName_,
    required String flag,
  }) : super(
          id: id,
          autoNumber: autoNumber_,
          vatId: vatId_,
          vatName: vatName_,
          flag: flag,
        );

  factory VatModel.fromJson(Map<String, dynamic> data) =>
      _$VatModelFromJson(data);

  Map<String, dynamic> toJson() => _$VatModelToJson(this);
}
