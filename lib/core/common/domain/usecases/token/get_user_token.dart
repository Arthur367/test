import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';

@lazySingleton
class GetUserTokenUseCase implements UseCase<TokenEntity, NoParams> {
  final TokenRepository _tokenRepository;

  const GetUserTokenUseCase(this._tokenRepository);

  @override
  Future<Either<Failure, TokenEntity>> call(NoParams params) async {
    return await _tokenRepository.getUserToken();
  }
}
