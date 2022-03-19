part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthResponse? authResponse;
  final UserDataClass? userData;

  const LoginSuccess({this.authResponse, this.userData});

  @override
  List<Object> get props => [authResponse!, userData!];

  @override
  String toString() => 'LoginSuccess { AuthResponse: $authResponse }';
}

class LoginError extends LoginState {
  final String error;

  const LoginError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginError { Error: $error }';
}
