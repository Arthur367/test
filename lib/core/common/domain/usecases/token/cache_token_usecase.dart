import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../repositories/repositories.dart';

@lazySingleton
class CacheTokenUseCase implements UseCase<void, TokenParams> {
  final TokenRepository _tokenRepository;

  const CacheTokenUseCase(this._tokenRepository);

  @override
  Future<Either<Failure, void>> call(TokenParams params) async {
    return await _tokenRepository.cacheToken(params.token);
  }
}

class TokenParams extends Equatable {
  final String token;

  const TokenParams({required this.token});

  @override
  List<Object> get props => [token];
}
