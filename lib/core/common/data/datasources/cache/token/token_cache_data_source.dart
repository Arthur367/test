import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../error/exceptions.dart';
import '../../../models/models.dart';

/// cache interactions with cache.
abstract class TokenCacheDataSource {
  /// Caches [TokenModel] to user cache after successful login
  Future<void> cacheToken(TokenModel token);

  /// Gets the cached [TokenModel] which stored after login
  ///
  /// Throws [CacheException] if token cached data is not present.
  Future<TokenModel> getToken();

  /// Clears cached token usually after a logout event
  ///
  /// Throws [CacheException] if token cached data is not present.
  Future<void> clearToken();
}

@LazySingleton(as: TokenCacheDataSource)
class TokenCacheDataSourceImpl implements TokenCacheDataSource {
  final SharedPreferences _prefs;

  const TokenCacheDataSourceImpl(this._prefs);

  @override
  Future<void> cacheToken(TokenModel token) {
    try {
      return _prefs.setString(AUTH_TOKEN, token.token!);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<TokenModel> getToken() async {
    try {
      String? token = _prefs.getString(AUTH_TOKEN);
      return TokenModel(token: token!);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      await _prefs.remove(AUTH_TOKEN);
    } catch (e) {
      throw CacheException();
    }
  }
}
