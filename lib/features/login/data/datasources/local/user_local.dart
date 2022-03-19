import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/data/models/models.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../database/app_database.dart';
import '../../../../../database/daos.dart';
import '../../../../../database/user/user_dao.dart';
import '../../models/user_model.dart';

/// Interactions with the local DB data.
/// for the user table
abstract class UserLocalDataSource {
  Future<int> insertUser(UserModel userModel);

  Future<int> insertLocation(LocationModel userLocation);

  Future<int> insertStore(StoreModel userStore);

  Future<UserDataClass?> retrieveUser();
}

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final UserDao _userDao;
  final StoreDao _storeDao;
  final LocationDao _locationDao;

  const UserLocalDataSourceImpl(
    this._userDao,
    this._storeDao,
    this._locationDao,
  );

  @override
  Future<int> insertUser(UserModel user) {
    try {
      return _userDao.insertUser(
        UserTableCompanion(
          name: Value(user.name),
          userCode: Value(user.id),
          username: Value(user.username),
          password: Value(user.password),
        ),
      );
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<UserDataClass?> retrieveUser() {
    try {
      return _userDao.selectUser();
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<int> insertLocation(LocationModel userLocation) {
    try {
      return _locationDao.insertLocation(
        LocationTableCompanion(
          locationCode: Value(userLocation.locationCode_),
          locationName: Value(userLocation.location),
        ),
      );
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<int> insertStore(StoreModel userStore) {
    try {
      return _storeDao.insertStore(
        StoreTableCompanion(
          storeCode: Value(userStore.storeCode),
          storeName: Value(userStore.storeName),
        ),
      );
    } catch (e) {
      throw DatabaseException();
    }
  }
}
