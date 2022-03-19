import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends TokenEntity {
  const TokenModel({
    required String token,
  }) : super(token: token);

  factory TokenModel.fromJson(Map<String, dynamic> data) =>
      _$TokenModelFromJson(data);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
