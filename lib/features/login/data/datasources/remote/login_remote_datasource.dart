import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/data/models/models.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/network/dio_config.dart';
import '../../models/user_model.dart';
import '../../responses/auth_response.dart';

abstract class LoginRemoteDataSource {
  Future<AuthResponse> login({
    required String username,
    required String password,
  });
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final DioClient client;

  const LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthResponse> login({
    required String username,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'username': username,
        'password': password,
      };

      var _response = await client.post(
        BASE_URL + '/api/auth/login',
        data: data,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );

      final UserModel _userModel = UserModel.fromJson(_response['user']);
      final LocationModel _locationModel =
          LocationModel.fromJson(_response['location']);
      final StoreModel _storeModel = StoreModel.fromJson(_response['store']);
      final TokenModel _tokenModel = TokenModel(token: _response['token']);

      return AuthResponse(
        userModel: _userModel,
        locationModel: _locationModel,
        storeModel: _storeModel,
        tokenModel: _tokenModel,
      );
    } catch (e) {
      rethrow;
    }
  }
}
