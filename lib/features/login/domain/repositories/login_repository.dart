import 'package:dartz/dartz.dart';
import 'package:mobile_pos/database/app_database.dart';

import '../../../../core/error/failures.dart';
import '../../data/responses/auth_response.dart';

abstract class LoginRepository {
  /// User login Repository
  Future<Either<Failure, AuthResponse>> login({
    required String username,
    required String password,
  });

  Future<Either<Failure, UserDataClass>> checkUser();
}
