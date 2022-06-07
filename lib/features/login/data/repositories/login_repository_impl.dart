import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/app_database.dart';

import '../../../../core/common/data/datasources/datasources.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/local/user_local.dart';
import '../datasources/remote/login_remote_datasource.dart';
import '../responses/auth_response.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  final TokenCacheDataSource tokenCacheDataSource;
  final UserLocalDataSource userLocalDataSource;
  final NetworkInfo networkInfo;

  const LoginRepositoryImpl({
    required this.loginRemoteDataSource,
    required this.tokenCacheDataSource,
    required this.userLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthResponse>> login({
    required String username,
    required String password,
  }) async {
    try {
      final _loginData = await loginRemoteDataSource.login(
        username: username,
        password: password,
      );

      /// save user token locally
      tokenCacheDataSource.cacheToken(_loginData.tokenModel);

      /// Save userdata, location, store to localdb
      userLocalDataSource.insertLocation(_loginData.locationModel);
      userLocalDataSource.insertStore(_loginData.storeModel);
      userLocalDataSource.insertUser(_loginData.userModel);

      return Right(_loginData);
    } on ServerException catch (_) {
      /// An error occurred emanating from the server
      return Left(ServerFailure());
    } on DatabaseException catch (_) {
      /// An error occurred emanating from local database operations
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, UserDataClass>> checkUser() async {
    try {
      final _userData = await userLocalDataSource.retrieveUser();
      return Right(_userData!);
    } on ServerException catch (_) {
      /// An error occurred emanating from the server
      return Left(ServerFailure());
    } on DatabaseException catch (_) {
      /// An error occurred emanating from local database operations
      return Left(DatabaseFailure());
    }
  }
}
