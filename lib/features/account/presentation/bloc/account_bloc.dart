import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/features/login/domain/usecases/get_currentuser.dart';

import '../../../../core/usecases/usecase.dart';

part 'account_event.dart';
part 'account_state.dart';

@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetCurrentUser _getCurrentUser;
  AccountBloc(this._getCurrentUser) : super(AccountInitial()) {
    on<AccountEventFetch>(_onAccountFetchEvent);
  }

  void _onAccountFetchEvent(
      AccountEventFetch event, Emitter<AccountState> emit) async {
    emit(AccountLoading());
    final user = await _getCurrentUser(NoParams());
    user.fold((l) => AccountError(), (r) => emit(AccountLoaded(account: r)));
  }
}
