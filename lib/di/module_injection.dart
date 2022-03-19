import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants.dart';

@module
abstract class RegisterModules {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  //register the baseUrl String
  @Named('baseUrl')
  String get baseUrl => BASE_URL;

  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

}
