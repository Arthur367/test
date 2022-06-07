import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/utils/shared_prefs.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/token/token_dao.dart';
import 'package:mobile_pos/main.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  LoginRemoteDataSourceImpl({
    required this.client,
    required this.preferences,
  });

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

      print(_response['token']);
      String _token = _response['token'];

      print(_token);
      Future<void> initializeSharedPrefs() async {
        preferences = await SharedPreferences.getInstance();
        preferences.setString('token', '${_response['token']}');
      }

      initializeSharedPrefs();

      //save token here;

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

  SharedPreferences preferences;
}
