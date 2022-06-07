part of 'initial_products_load_bloc.dart';

abstract class InitialProductsLoadEvent extends Equatable {
  const InitialProductsLoadEvent();

  @override
  List<Object> get props => [];
}

class ProductsDownloadButtonPressed extends InitialProductsLoadEvent {}
