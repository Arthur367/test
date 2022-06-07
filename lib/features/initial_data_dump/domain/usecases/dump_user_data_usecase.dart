// import 'package:injectable/injectable.dart';
// import 'package:mobile_pos/core/error/failures.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mobile_pos/core/usecases/usecase.dart';
// import 'package:mobile_pos/features/initial_data_dump/domain/repositories/initial_data_dump_repository.dart';

// @lazySingleton
// class DumpUserDataUseCase implements UseCase<void, NoParams> {
//   final InitialDataDumpRepository initialDataDumpRepository;

//   const DumpUserDataUseCase(this.initialDataDumpRepository);

//   @override
//   Future<Either<Failure, void>> call(NoParams params) async {
//     return await initialDataDumpRepository.dumpUserData();
//   }
// }
