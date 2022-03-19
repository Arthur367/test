import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/features/login/domain/usecases/get_currentuser.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/responses/auth_response.dart';
import '../../domain/usecases/authenticate_user.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticateUser _authenticateUser;
  final GetCurrentUser _getCurrentUser;

  LoginBloc(this._authenticateUser, this._getCurrentUser)
      : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(_onLoginButtonPressedEvent);
    on<CheckUserEvent>(_onCheckUserEvent);
  }

  Future<void> _onLoginButtonPressedEvent(
    LoginButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final result = await _authenticateUser.call(LoginParams(
      username: event.username,
      password: event.password,
    ));
    emit(
      result.fold(
        (l) => LoginError(error: l.toString()),
        (r) => LoginSuccess(authResponse: r),
      ),
    );
  }

  Future<void> _onCheckUserEvent(
    CheckUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    final result = await _getCurrentUser.call(NoParams());
    emit(
      result.fold(
        (l) => LoginError(error: l.toString()),
        (r) => LoginSuccess(userData: r),
      ),
    );
  }
}
