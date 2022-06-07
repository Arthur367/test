part of 'initial_load_customer_bloc.dart';

abstract class InitialCustomerLoadEvent extends Equatable {
  const InitialCustomerLoadEvent();

  @override
  List<Object> get props => [];
}

class CustomerDownloadButtonPressed extends InitialCustomerLoadEvent {}
