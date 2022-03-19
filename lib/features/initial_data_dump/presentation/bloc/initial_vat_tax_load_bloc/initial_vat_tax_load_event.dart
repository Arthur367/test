part of 'initial_vat_tax_load_bloc.dart';

abstract class InitialVatTaxLoadEvent extends Equatable {
  const InitialVatTaxLoadEvent();

  @override
  List<Object> get props => [];
}

class VatTaxDownloadButtonPressed extends InitialVatTaxLoadEvent {}
