import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_pos/core/common/domain/entities/entities.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel extends CustomerEntity {
  @JsonKey(name: 'customer_code')
  final String customerId;

  const CustomerModel({int? id, required this.customerId, required String name})
      : super(id: id, customerId: customerId, name: name);

  factory CustomerModel.fromJson(Map<String, dynamic> data) =>
      _$CustomerModelFromJson(data);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
