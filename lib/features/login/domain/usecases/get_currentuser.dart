import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/app_database.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class GetCurrentUser extends UseCase<UserDataClass, NoParams> {
  final LoginRepository _loginRepository;

  GetCurrentUser(this._loginRepository);

  @override
  Future<Either<Failure, UserDataClass>> call(NoParams params) {
    return _loginRepository.checkUser();
  }
}
