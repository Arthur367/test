import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../repositories/repositories.dart';

@lazySingleton
class ClearTokenUseCase implements UseCase<void, NoParams> {
  final TokenRepository _tokenRepository;

  const ClearTokenUseCase(this._tokenRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _tokenRepository.clearToken();
  }
}
