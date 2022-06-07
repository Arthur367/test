part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final UserDataClass account;
  const AccountLoaded({required this.account});
  @override
  List<Object> get props => [account];
}
class AccountError extends AccountState {}