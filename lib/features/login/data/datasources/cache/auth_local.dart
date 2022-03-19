import 'package:injectable/injectable.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthCacheDataSource {
  Future<void> cacheToken({required String token});

  Future<String?>? getToken();
}

@LazySingleton(as: AuthCacheDataSource)
class AuthCacheDataSourceImpl implements AuthCacheDataSource {
  final SharedPreferences sharedPreferences;

  const AuthCacheDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> cacheToken({required String token}) {
    try {
      return sharedPreferences.setString(AUTH_TOKEN, token);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<String?>? getToken() {
    try {
      String? token = sharedPreferences.getString(AUTH_TOKEN);
      if (token == null) {
        return null;
      }
      return Future.value(token);
    } catch (e) {
      throw CacheException();
    }
  }
}
