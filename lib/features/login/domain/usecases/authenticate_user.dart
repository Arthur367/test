import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/responses/auth_response.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class AuthenticateUser extends UseCase<AuthResponse, LoginParams> {
  final LoginRepository _loginRepository;

  AuthenticateUser(this._loginRepository);

  @override
  Future<Either<Failure, AuthResponse>> call(LoginParams params) {
    return _loginRepository.login(
      username: params.username,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}
