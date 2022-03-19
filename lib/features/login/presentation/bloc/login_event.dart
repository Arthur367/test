part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressedEvent({
    required this.username,
    required this.password,
  });
}

class CheckUserEvent extends LoginEvent {
  const CheckUserEvent();

  @override
  List<Object> get props => [];
}
