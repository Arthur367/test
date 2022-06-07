import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/login.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  @JsonKey(name: 'email_address')
  final String email;
  final String id;
  final String password;

  const UserModel({
    required this.id,
    required this.email,
    required this.password,
    required String name,
    required String username,
  }) : super(username: username, name: name, useremail: email);

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
