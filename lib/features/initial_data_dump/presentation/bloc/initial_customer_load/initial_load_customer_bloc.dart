import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_pos/core/usecases/usecase.dart';
import 'package:mobile_pos/features/initial_data_dump/domain/usecases/load_customer_data_usecase.dart';

part 'initial_load_customer_event.dart';
part 'initial_load_customer_state.dart';

@Injectable()
class InitialCustomerLoadBloc
    extends Bloc<InitialCustomerLoadEvent, InitialCustomerLoadState> {
  final LoadCustomerUseCase _loadCustomerUseCase;

  InitialCustomerLoadBloc(this._loadCustomerUseCase)
      : super(InitialCustomerLoadInitial()) {
    on<CustomerDownloadButtonPressed>(_onCustomerPressed);
  }

  void _onCustomerPressed(
    CustomerDownloadButtonPressed event,
    Emitter<InitialCustomerLoadState> emit,
  ) async {
    emit(InitialCustomerLoadLoading());
    final result = await _loadCustomerUseCase.call(NoParams());
    emit(
      result.fold(
        (l) => InitialCustomerLoadError(error: l.toString()),
        (r) => const InitialCustomerLoaded(message: 'Customer Saved.emit'),
      ),
    );
  }
}
