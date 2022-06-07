// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      email: json['email_address'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'email_address': instance.email,
      'id': instance.id,
      'password': instance.password,
    };
