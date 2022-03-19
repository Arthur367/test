import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'initial_data_dump_event.dart';
part 'initial_data_dump_state.dart';

class InitialDataDumpBloc extends Bloc<InitialDataDumpEvent, InitialDataDumpState> {
  InitialDataDumpBloc() : super(InitialDataDumpInitial()) {
    on<InitialDataDumpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
